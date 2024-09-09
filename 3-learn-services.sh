#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

pe "bat labs/services/specs/pods/whoami.yaml"

pe "bat labs/services/specs/pods/sleep.yaml"

pe "kubectl apply -f labs/services/specs/pods"

pe "kubectl get pods -o wide --show-labels"

pe "kubectl exec sleep -- nslookup whoami.default.svc.cluster.local"

pe "bat labs/services/specs/services/whoami-clusterip.yaml"

pe "kubectl apply -f labs/services/specs/services/whoami-clusterip.yaml"

pe "kubectl get service whoami"

pe "kubectl describe svc whoami"

pe "kubectl exec sleep -- nslookup whoami.default.svc.cluster.local"

wait 

pe "kubectl exec sleep -- curl -s http://whoami.default.svc.cluster.local"

pe "kubectl get pods -o wide -l \"app=whoami\""

pe "kubectl delete pods -l app=whoami"

pe "kubectl apply -f labs/services/specs/pods"

pe "kubectl get pods -o wide -l app=whoami"

pe "kubectl exec sleep -- nslookup whoami.default.svc.cluster.local"

pe "kubectl exec sleep -- curl -s http://whoami.default.svc.cluster.local"

pe "kubectl apply -f labs/services/specs/services/whoami-nodeport.yaml"

pe "kubectl get svc -l app=whoami"

pe "kubectl exec sleep -- curl -s http://whoami-np.default.svc.cluster.local:8010"

pe "open http://localhost:30010"

pe "kubectl delete pod,svc -l kubernetes.courselabs.co=services"

