import subprocess

APP_LABEL = "app=myapp"

def get_pods():
    result = subprocess.run(
        ["kubectl", "get", "pods", "-l", APP_LABEL, "-o", "jsonpath={.items[*].metadata.name}"],
        capture_output=True,
        text=True
    )

    pods = result.stdout.split()
    return pods


def fetch_logs(pod):
    print(f"\n===== Logs from {pod} =====")

    result = subprocess.run(
        ["kubectl", "logs", pod],
        capture_output=True,
        text=True
    )

    print(result.stdout)


def main():
    pods = get_pods()

    if not pods:
        print("No pods found for the app.")
        return

    for pod in pods:
        fetch_logs(pod)


if __name__ == "__main__":
    main()