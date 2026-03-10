from kubernetes import client, config

# Load kubeconfig
config.load_kube_config()

v1 = client.CoreV1Api()


def restart_crashloop_pods():
    pods = v1.list_pod_for_all_namespaces(watch=False)

    for pod in pods.items:
        namespace = pod.metadata.namespace
        name = pod.metadata.name    

        if pod.status.container_statuses:
            for container in pod.status.container_statuses:
                if container.state.waiting and container.state.waiting.reason == "CrashLoopBackOff":
    
                    print(f"Restarting Pod: {name} in Namespace: {namespace}")

                    # Delete pod so deployment recreates it
                    v1.delete_namespaced_pod(
                        name=name,
                        namespace=namespace
                    )

                    print(f"Pod {name} deleted. Kubernetes will recreate it.")

if __name__ == "__main__":
    restart_crashloop_pods()

