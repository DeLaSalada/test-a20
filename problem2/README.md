# Nginx Web Server with HPA

## Prerequisites
1. Install Helm and Helmfile.
2. Install the Helm Diff plugin:
   ```bash
   helm plugin install https://github.com/databus23/helm-diff
2. Ensure MicroK8s is running with the `metrics-server` addon enabled.
3. Clone this repository.

## Deployment Steps
1. Apply the Helmfile to deploy the resources:
   ```bash
   helmfile apply
