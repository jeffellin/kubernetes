#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

pe "bat labs/configmaps/specs/configurable/deployment.yaml"

pe "kubectl apply -f labs/configmaps/specs/configurable/"

pe "kubectl exec deploy/configurable -- printenv | grep __"

pe "bat labs/configmaps/specs/configurable/config-env/configmap-env.yaml"

pw "bat labs/configmaps/specs/configurable/config-env/deployment-env.yaml"

pe "kubectl apply -f labs/configmaps/specs/configurable/config-env/"

pe "kubectl exec deploy/configurable -- printenv | grep __"

pe "kubectl delete configmap,deploy,svc,pod -l kubernetes.courselabs.co=configmaps"

