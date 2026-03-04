from kubernetes import client, config
from kubernetes.client.rest import ApiException

def connect_to_cluster():
    try:
        config.load_kube_config()
        print("connected to the cluster...")
    except Exception as e:
        print("Not able to connect to the cluster..")


def check_pod_health():
    try:
        v1=client.CoreV1Api()
        pods= v1.list_pod_for_all_namespaces()

        print("Printing the pods within the namespaces...")
        print("-------------------------------------------")

        for pod in pods.items:
            pod_name= pod.metadata.name
            namespace= pod.metadata.namespace
            status= pod.status.phase

            if status != "Running":
                print(f"Namespaces: {namespace} | pod: {pod} | status; {status}")

    except ApiException as e:
        print("Kubernetes API server error: ",e)
        exit(1)

def main():
    connect_to_cluster()
    check_pod_health()



if __name__=="__main__":
    main()


