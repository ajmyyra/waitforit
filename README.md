# Waitforit - Wait-for-it.sh dockerised

This is a dockerised version of [wait-for-it.sh script by Giles Hall](https://github.com/vishnubob/wait-for-it) to be used as initContainer for Kubernetes. 

The script checks for specified host and TCP port to see if it's already up, and waits if it is not. 

# Why?

When using ready-made containers, you can have Kubernetes restart the pod until the external service (a database, for example) is ready and the application runs, but a better way is to wait until dependencies are in place. This solves that issue.

If you're building your own images, there's no need to have initContainers in place as your can just add the original [wait-for-it.sh](https://github.com/vishnubob/wait-for-it/blob/master/wait-for-it.sh) to your Dockerfile to be run before the application is started.

# Dockerised version

TODO