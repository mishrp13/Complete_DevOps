import logging
import os

logging.basicConfig(
    filename="file_check.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

file_name = "test.txt"

if os.path.exists(file_name):
    logging.info(f"File '{file_name}' exists")
else:
    logging.warning(f"File '{file_name}' not found")
