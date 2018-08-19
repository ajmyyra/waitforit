# Waitforit - Wait-for-it.sh dockerised

This is a dockerised version of [wait-for-it.sh script by Giles Hall](https://github.com/vishnubob/wait-for-it) to be used as initContainer for Kubernetes. 

The script checks for specified host and TCP port to see if it's already up, and waits if it is not. 

# Why?

When using ready-made containers, you can have Kubernetes restart the pod until the external service (a database, for example) is ready and the application runs, but a better way is to wait until dependencies are in place. This approach also works in a scenario of multiple dependencies where we need to wait for databases, load balancer, Kafka cluster or even networking to come up at the same time.

If you're building your own images, there's no need to have initContainers in place as your can just add the original [wait-for-it.sh](https://github.com/vishnubob/wait-for-it/blob/master/wait-for-it.sh) to your Dockerfile to be run before the application is started.

# Dockerised version

Ready-built container is found in Docker Hub. You can run it simply with the following command:

```
docker run --rm -e HOST=example.com -e PORT=80 -e TIMEOUT=15 ajmyyra/waitforit:1
```

# Usage as Kubernetes InitContainer

Lets assume you have a database-backed application that you want to start after the database itself is up. You can define waitforit as InitContainer for your pod, so it will run to check database status before the actual pod starts.

Add this before containers in your specfile:
```
initContainers:
- name: database-check
  image: ajmyyra/waitforit:1
  env:
  - name: HOST
    value: mysql-service
  - name: PORT
    value: '3306'
```

This way Kubernetes waits before starting the real application until the database is up and responding. If you want to change the timeout from standard 120 seconds, just add it as the TIMEOUT variable in seconds.