import psutil
import yaml
import logging
import argparse

# Parse CLI argument
parser = argparse.ArgumentParser(description="System Monitoring Script")
parser.add_argument("--config", default="config.yaml", help="Path to config file")
args = parser.parse_args()

# Load config file
try:
    with open(args.config, "r") as file:
        config = yaml.safe_load(file)
except Exception as e:
    print("Error loading config file:", e)
    exit(1)

cpu_threshold = config["cpu_threshold"]
memory_threshold = config["memory_threshold"]
disk_threshold = config["disk_threshold"]
log_file = config["log_file"]

# Setup logging
logging.basicConfig(
    filename=log_file,
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

try:
    cpu = psutil.cpu_percent()
    memory = psutil.virtual_memory().percent
    disk = psutil.disk_usage("/").percent

    print(f"CPU: {cpu}%")
    print(f"Memory: {memory}%")
    print(f"Disk: {disk}%")

    if cpu > cpu_threshold:
        logging.warning(f"CPU usage high: {cpu}%")

    if memory > memory_threshold:
        logging.warning(f"Memory usage high: {memory}%")

    if disk > disk_threshold:
        logging.warning(f"Disk usage high: {disk}%")

except Exception as e:
    logging.error(f"Script failed: {e}")