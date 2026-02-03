
# Monitor CPU and memory usage every N seconds.

import psutil
import time

INTERVAL = 5  # seconds

while True:
    cpu_usage = psutil.cpu_percent(interval=1)
    memory = psutil.virtual_memory()
    memory_usage = memory.percent

    print(f"CPU Usage: {cpu_usage}% | Memory Usage: {memory_usage}%")

    time.sleep(INTERVAL)
