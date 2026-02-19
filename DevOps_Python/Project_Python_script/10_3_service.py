import logging
import random

logging.basicConfig(
    filename="service.log",
    level=logging.INFO,
    format="%(asctime)s - %(levelname)s - %(message)s"
)

services = ["nginx", "docker", "kubernetes"]

for service in services:
    status = random.choice(["running", "stopped"])
    if status == "running":
        logging.info(f"Service {service} is running")
    else:
        logging.error(f"Service {service} is stopped")
