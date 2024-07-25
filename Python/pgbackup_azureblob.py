import os
import subprocess
from datetime import datetime
from azure.storage.blob import BlobServiceClient

# Configuration
DB_CONTAINER = "your_db_container_name"
DB_NAME = "your_db_name"
BACKUP_DIR = "/tmp/backups"
BACKUP_FILENAME = f"{DB_NAME}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"

# Azure Blob Storage Configuration
AZURE_CONNECTION_STRING = "your_azure_connection_string"
AZURE_CONTAINER = "your_azure_container"

def create_backup():
    os.makedirs(BACKUP_DIR, exist_ok=True)
    backup_path = os.path.join(BACKUP_DIR, BACKUP_FILENAME)
    
    cmd = f"docker exec {DB_CONTAINER} pg_dump -U postgres {DB_NAME} > {backup_path}"
    subprocess.run(cmd, shell=True, check=True)
    return backup_path

def upload_to_azure(file_path):
    blob_service_client = BlobServiceClient.from_connection_string(AZURE_CONNECTION_STRING)
    blob_client = blob_service_client.get_blob_client(container=AZURE_CONTAINER, blob=os.path.basename(file_path))
    
    with open(file_path, "rb") as data:
        blob_client.upload_blob(data)

if __name__ == "__main__":
    backup_file = create_backup()
    upload_to_aws(backup_file)
    upload_to_azure(backup_file)
    upload_to_gcs(backup_file)
    os.remove(backup_file)  # Clean up local backup file
    print("Backup completed and uploaded to all cloud storages.")