#!/bin/bash

# Set the time zone
export TZ=Africa/Lagos

# Set variables
BACKUP_DIR="/var/lib/postgresql/pgbackup"
DB_NAME="plemuz"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${DATE}.sql.gz"
LOG_FILE="/var/lib/postgresql/postgres_backup.log"

# S3 variables
S3_BUCKET="pg-backup"
S3_PROFILE="eu2"
S3_REGION="default"
S3_ENDPOINT="https://eu2.contabostorage.com"

# Function for logging
log() {
    echo "$(date): $1" >> "$LOG_FILE"
}

# Ensure backup directory exists
mkdir -p "$BACKUP_DIR"

# Start logging
log "Backup started"

# Perform the backup
if pg_dump -U postgres "$DB_NAME" | gzip > "$BACKUP_FILE"; then
    log "Database backup created successfully"
else
    log "Failed to create database backup"
    exit 1
fi

# Upload to S3
log "Uploading backup to S3"
if aws --profile "$S3_PROFILE" --region "$S3_REGION" --endpoint-url "$S3_ENDPOINT" \
    s3 cp "$BACKUP_FILE" "s3://$S3_BUCKET/"; then
    log "Backup successfully uploaded to S3"
else
    log "Failed to upload backup to S3"
fi

# Remove oldest local backup if more than 5 backups exist
local_backup_count=$(ls -1 "$BACKUP_DIR"/${DB_NAME}_*.sql.gz | wc -l)
if [ "$local_backup_count" -gt 5 ]; then
    oldest_backup=$(ls -t "$BACKUP_DIR"/${DB_NAME}_*.sql.gz | tail -1)
    if rm "$oldest_backup"; then
        log "Removed oldest local backup: $oldest_backup"
    else
        log "Failed to remove oldest local backup: $oldest_backup"
    fi
fi

# Remove oldest S3 backup if more than 5 backups exist
s3_backup_count=$(aws --profile "$S3_PROFILE" --region "$S3_REGION" --endpoint-url "$S3_ENDPOINT" \
    s3 ls "s3://$S3_BUCKET/" | wc -l)
if [ "$s3_backup_count" -gt 5 ]; then
    oldest_s3_backup=$(aws --profile "$S3_PROFILE" --region "$S3_REGION" --endpoint-url "$S3_ENDPOINT" \
        s3 ls "s3://$S3_BUCKET/" | sort | head -1 | awk '{print $4}')
    if aws --profile "$S3_PROFILE" --region "$S3_REGION" --endpoint-url "$S3_ENDPOINT" \
        s3 rm "s3://$S3_BUCKET/$oldest_s3_backup"; then
        log "Removed oldest S3 backup: $oldest_s3_backup"
    else
        log "Failed to remove oldest S3 backup: $oldest_s3_backup"
    fi
fi

log "Backup process completed"
