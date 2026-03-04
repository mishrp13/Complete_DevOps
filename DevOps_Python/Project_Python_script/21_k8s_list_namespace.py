from kubernetes import client, config
from kubernetes.client.rest import ApiException


def connect_to_cluster():
    """Load kubeconfig and connect to cluster"""
    try:
        config.load_kube_config()  # Loads ~/.kube/config
        print("✅ Connected to Kubernetes cluster.")
    except Exception as e:
        print("❌ Failed to connect to cluster:", e)
        exit(1)


def list_namespaces():
    """List all namespaces in the cluster"""
    try:
        v1 = client.CoreV1Api()
        namespaces = v1.list_namespace()

        print("\n📦 Namespaces in cluster:")
        print("----------------------------")

        for ns in namespaces.items:
            print(f"- {ns.metadata.name}")

    except ApiException as e:
        print("❌ Error fetching namespaces:", e)
        exit(1)


def main():
    connect_to_cluster()
    list_namespaces()


if __name__ == "__main__":
    main()


# client → Used to interact with Kubernetes APIs (pods, services, namespaces, etc.)

# config → Used to load cluster configuration (kubeconfig file)