import os
from datetime import datetime, timedelta

# ===== CONFIGURATION =====
DIRECTORY_PATH = "/path/to/your/directory"   # change this
DAYS_OLD = 7                                 # change this (X days)
# =========================

# Calculate cutoff time
cutoff_date = datetime.now() - timedelta(days=DAYS_OLD)

# Loop through files in directory
for filename in os.listdir(DIRECTORY_PATH):
    file_path = os.path.join(DIRECTORY_PATH, filename)

    # Check if it's a file (not a folder)
    if os.path.isfile(file_path):
        file_modified_time = datetime.fromtimestamp(os.path.getmtime(file_path))

        # Delete if older than X days
        if file_modified_time < cutoff_date:
            os.remove(file_path)
            print(f"Deleted: {file_path}")

print("Disk cleanup completed.")
