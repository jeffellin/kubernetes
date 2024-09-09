#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

pe "kubectl get nodes"

pe "kubectl describe nodes"

pei echo "Every object in Kubernetes can have labels - they are key-value pairs used to record additional information about the object."

pe "kubectl get nodes --show-labels"

pe "kubectl get nodes --label-columns kubernetes.io/arch,kubernetes.io/os"

#pe "ubectl get node <your-node> -o jsonpath='{.metadata.labels}"
TYPE_SPEED=100
p "The Pod is the basic unit of compute in Kubernetes. Pods run containers - it\'s their job to ensure the container keeps running."
TYPE_SPEED=10
pe "kubectl get pods"

pe bat labs/pods/specs/whoami-pod.yaml
# Put your stuff here
pe "kubectl apply -f labs/pods/specs/whoami-pod.yaml"

p "Now you can use the familiar commands to print information:"

pe "kubectl get pods"

pe "kubectl get po -o wide"

p "Print Pod Details"

pe "kubectl describe pod whoami"

p "print the container logs"

pe "kubectl logs whoami"

p "cleanup"

pe "kubectl delete pod  whoami "