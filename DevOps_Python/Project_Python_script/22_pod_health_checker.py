from kubernetes import client, config
from kubernetes.client.rest import ApiException


def connect_to_cluster():
    try:
        config.load_kube_config()  # for local testing
        print("Connected to cluster")
    except Exception as e:
        print("Failed to connect:", e)
        exit(1)


def check_pod_health():
    try:
        v1 = client.CoreV1Api()
        pods = v1.list_pod_for_all_namespaces()

        print("\nPods NOT in Running state:")
        print("-----------------------------------")

        for pod in pods.items:
            pod_name = pod.metadata.name
            namespace = pod.metadata.namespace
            status = pod.status.phase

            if status != "Running":
                print(f"Namespace: {namespace} | Pod: {pod_name} | Status: {status}")

    except ApiException as e:
        print("Kubernetes API error:", e)
        exit(1)


def main():
    connect_to_cluster()
    check_pod_health()


if __name__ == "__main__":
    main()