import os
import subprocess
from datetime import datetime
import boto3

# Configuration
DB_CONTAINER = "your_db_container_name"
DB_NAME = "your_db_name"
BACKUP_DIR = "/tmp/backups"
BACKUP_FILENAME = f"{DB_NAME}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"

# AWS S3 Configuration
AWS_BUCKET = "your_aws_bucket"
AWS_REGION = "your_aws_region"

# Azure Blob Storage Configuration
AZURE_CONNECTION_STRING = "your_azure_connection_string"
AZURE_CONTAINER = "your_azure_container"

# Google Cloud Storage Configuration
GCS_BUCKET = "your_gcs_bucket"
GCS_CREDENTIALS_FILE = "path/to/your/gcs_credentials.json"

def create_backup():
    os.makedirs(BACKUP_DIR, exist_ok=True)
    backup_path = os.path.join(BACKUP_DIR, BACKUP_FILENAME)
    
    cmd = f"docker exec {DB_CONTAINER} pg_dump -U postgres {DB_NAME} > {backup_path}"
    subprocess.run(cmd, shell=True, check=True)
    return backup_path

def upload_to_aws(file_path):
    s3 = boto3.client('s3', region_name=AWS_REGION)
    s3.upload_file(file_path, AWS_BUCKET, os.path.basename(file_path))

if __name__ == "__main__":
    backup_file = create_backup()
    upload_to_aws(backup_file)
    upload_to_azure(backup_file)
    upload_to_gcs(backup_file)
    os.remove(backup_file)  # Clean up local backup file
    print("Backup completed and uploaded to all cloud storages.")