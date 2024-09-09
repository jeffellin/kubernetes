#!/bin/bash

########################
# include the magic
########################
. demo-magic.sh

pe "bat labs/secrets/specs/configurable/secrets-encoded/secret-encoded.yaml"

pe "bat labs/secrets/specs/configurable/secrets-encoded/deployment-env.yaml"

pe "kubectl apply -f labs/secrets/specs/configurable/secrets-encoded"

pe "kubectl port-forward deployment/configurable 30010:80"

pe "bat labs/secrets/specs/configurable/secrets-plain/secret-plain.yaml"

pe "kubectl apply -f labs/secrets/specs/configurable/secrets-plain/"

pe "bat labs/secrets/specs/configurable/secrets-plain/deployment-env.yaml"

pe "kubectl describe secret configurable-env-plain"

pe "kubectl get secret configurable-env-plain -o jsonpath=\"{.data.Configurable__Environment}\""

pe "kubectl get secret configurable-env-plain -o jsonpath=\"{.data.Configurable__Environment}\" | base64 -d"

pe "bat ./labs/secrets/secrets/configurable.env"
pe "bat ./labs/secrets/secrets/secret.json"

pe "kubectl create secret generic configurable-env-file --from-env-file ./labs/secrets/secrets/configurable.env"
pe "kubectl create secret generic configurable-secret-file --from-file ./labs/secrets/secrets/secret.json"

pe "bat ./labs/secrets/specs/configurable/secrets-file/deployment.yaml"

pe "kubectl apply -f ./labs/secrets/specs/configurable/secrets-file/"

p "open http://localhost:30010"
pe "kubectl port-forward deployment/configurable 30010:80"
pe "kubectl exec deployment/configurable -- ls -la /app/secrets"
pe "kubectl exec deployment/configurable -- cat /app/secrets/secret.json"
pe "kubectl delete all,cm,secret -l kubernetes.courselabs.co=secrets"