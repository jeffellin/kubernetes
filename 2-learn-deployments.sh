#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

pe "bat labs/deployments/specs/deployments/whoami-v1.yaml"

pe "kubectl apply -f labs/deployments/specs/deployments/whoami-v1.yaml"

pe "kubectl get pods -l app=whoami"

pe "kubectl get deployments"

pe "kubectl get deployments -o wide"

pe "kubectl describe deploy whoami"

pe "kubectl scale deploy whoami --replicas 3"

pe "kubectl get pods -l app=whoami"

p "never do this deployment spec doesn't match"

pe "bat labs/deployments/specs/deployments/whoami-v1-scale.yaml"

pe "kubectl apply -f labs/deployments/specs/deployments/whoami-v1-scale.yaml"

pe "kubectl get pods -l app=whoami"
p "change an env variable"
pe "bat labs/deployments/specs/deployments/whoami-v2.yaml"

p "open in a new terminal kubectl get po -l app=whoami --watch"

pe "kubectl apply -f labs/deployments/specs/deployments/whoami-v2.yaml"

pe "kubectl delete deploy,svc -l \"kubernetes.courselabs.co=deployments\""
