import os
import zipfile
from datetime import datetime


def backup_directory(source_dir, backup_dir):
    # Create backup directory if it doesn't exist
    if not os.path.exists(backup_dir):
        os.makedirs(backup_dir)

    # Generate timestamp (YYYYMMDD_HHMMSS)
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

    # Create zip file name
    zip_filename = f"backup_{timestamp}.zip"
    zip_path = os.path.join(backup_dir, zip_filename)
    
    # Create zip file
    
    with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
        # Walk through directory
        for root, dirs, files in os.walk(source_dir):
            for file in files:
                file_path = os.path.join(root, file)
                
                # Preserve folder structure inside zip
                arcname = os.path.relpath(file_path, source_dir)
                
                zipf.write(file_path, arcname)

    print(f"✅ Backup created successfully: {zip_path}")


if __name__ == "__main__":
    source_directory = "/path/to/source"
    backup_directory_path = "/path/to/backup"

    backup_directory(source_directory, backup_directory_path)
