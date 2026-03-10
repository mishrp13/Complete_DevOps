import subprocess

def get_node_metrics():
    try:
        result = subprocess.run(
            ["kubectl", "top", "nodes", "--no-headers"],
            capture_output=True,
            text=True,
            check=True
        )

        lines = result.stdout.strip().split("\n")

        print("\nNode Resource Usage:\n")

        for line in lines:
            parts = line.split()
            node_name = parts[0]
            cpu = parts[1]
            cpu_percent = parts[2]
            memory = parts[3]
            memory_percent = parts[4]

            print(f"Node: {node_name}")
            print(f"CPU Usage: {cpu} ({cpu_percent})")
            print(f"Memory Usage: {memory} ({memory_percent})")
            print("-" * 40)

    except Exception as e:
        print("Error fetching node metrics:", e)

if __name__ == "__main__":
    get_node_metrics()