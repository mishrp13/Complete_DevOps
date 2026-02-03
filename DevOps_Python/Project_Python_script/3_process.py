import psutil

process_list = []

for process in psutil.process_iter(['pid', 'name', 'cpu_percent']):
    try:
        process_list.append(process.info)
    except (psutil.NoSuchProcess, psutil.AccessDenied):
        pass

top_processes = sorted(
    process_list,
    key=lambda p: p['cpu_percent'],
    reverse=True
)[:5]

print("Top 5 Processes by CPU Usage:")
for proc in top_processes:
    print(f"PID: {proc['pid']} | Name: {proc['name']} | CPU: {proc['cpu_percent']}%")
