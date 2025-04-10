# Merly Mentor Kubernetes Helm Charts
The code is offered as-is without any guarantees.

## Usage:

### Prerequisites
Ensure that [Helm](https://helm.sh) is installed on your system before proceeding. For installation instructions and an introduction to Helm, please refer to the [Helm documentation](https://helm.sh/docs/).

### Adding the Merly Mentor Helm Repository
Once Helm is properly installed and configured, you can add the `merly-mentor` Helm repository by running the following command:

```bash
helm repo add merly-mentor https://charts.merly-mentor.ai
```

### Searching for Available Charts
After adding the repository, you can search for the available Helm charts using:

```bash
helm search repo merly-mentor
```

## Installation

### Standard Installation

```bash
helm install my-release merly-mentor/merly-mentor
```

### On kind or minikube

1. Install NFS server:
   ```bash
   helm repo add nfs-server https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
   helm repo update
   helm install nfs-server nfs-server/nfs-server-k8s
   ```

2. Install Merly Mentor with NFS storage:
   ```bash
   helm install my-release merly-mentor/merly-mentor \
     --set logsPersistence.storageClass=nfs \
     --set persistence.storageClass=nfs
   ```

### Uninstallation

To remove the deployment:

```bash
helm delete my-release
```
The command removes all the Kubernetes components associated with the chart and deletes the release.

## Example
To run Merly Mentor in your Kubernetes cluster, a valid license key is required. You can obtain a free 30-day trial license by signing up for an early access account [here](https://www.merly.ai/early-access).

```bash
helm install my-release merly-mentor/merly-mentor --set global.registrationKey="your-registration-key-value"
```

#### Serve Merly Mentor using ingress
```yaml
global:
  registrationKey: "your-registration-key-value"
ingress:
  enabled: true
  className: "nginx"
  hosts:
    - host: chart-example.local
      paths:
        - path: /
          pathType: ImplementationSpecific
```

## Configuration
| Parameter                                        | Description                                         | Default                          |
|--------------------------------------------------|-----------------------------------------------------|----------------------------------|
| `nameOverride`                                   | Override the chart name                             | `""`                             |
| `global.registrationKey`                         | Registration key for global settings                | `''`                             |
| `global.persistence.storageClass`                | Storage class for persistent volume (optional)      | `"default"`                      |
| `global.persistence.size`                        | Size of the persistent volume (optional)            | `"4Gi"`                          |
| `global.persistence.pvcNameOverride`             | PVC name override for persistence (optional)        | `"merly-mentor-pvc"`             |
| `bridge.replicaCount`                            | Number of replicas for the bridge service (optional)| `1`                              |
| `bridge.nameOverride`                            | Override the name for bridge service (optional)     | `"merly-bridge"`                 |
| `bridge.image.repository`                        | Repository for the bridge image                     | `merlyai/merly-mentor-bridge`    |
| `bridge.image.tag`                               | Tag for the bridge image                            | `v0.1.0`                         |
| `bridge.containerPort`                           | Container port for the bridge service (default)     | `8080`                           |
| `mentor.nameOverride`                            | Override the name for mentor service (optional)     | `"merly-mentor"`                 |
| `mentor.replicaCount`                            | Number of replicas for the mentor service           | `1`                              |
| `mentor.image.repository`                        | Repository for the mentor image                     | `merlyai/merly-mentor-daemon`    |
| `mentor.image.tag`                               | Tag for the mentor image                            | `v0.4.19`                        |
| `mentor.containerPort`                           | Container port for the mentor service               | `4200`                           |
| `mentor.initContainers.merlyModelsInit.image.repository` | Repository for models init container         | `merlyai/merly-mentor-models`    |
| `mentor.initContainers.merlyModelsInit.image.tag`        | Tag for models init container                | `v2.0.0`                         |
| `mentor.initContainers.merlyAssetsInit.image.repository` | Repository for assets init container         | `merlyai/merly-mentor-assets`    |
| `mentor.initContainers.merlyAssetsInit.image.tag`        | Tag for assets init container                | `v1.0.0`                         |
| `merlyUi.replicaCount`                           | Number of replicas for the UI service               | `1`                              |
| `merlyUi.nameOverride`                           | Override the name for UI service (optional)         | `"merly-ui"`                     |
| `merlyUi.image.repository`                       | Repository for the UI image                         | `merlyai/merly-mentor-ui`        |
| `merlyUi.image.tag`                              | Tag for the UI image                                | `v0.1.0`                         |
| `merlyUi.containerPort`                          | Container port for the UI service                   | `3000`                           |
| `ingress.enabled`                                | Enable or disable ingress                           | `false`                          |
| `ingress.className`                              | Class name for ingress                              | `""`                             |
| `ingress.annotations`                            | Annotations for ingress                             | `{}`                             |
| `ingress.hosts[0].host`                          | Host for ingress                                    | `chart-example.local`            |
| `ingress.hosts[0].paths[0].path`                 | Path for ingress                                    | `/`                              |
| `ingress.hosts[0].paths[0].pathType`             | Path type for ingress                               | `ImplementationSpecific`         |
| `ingress.tls[0].secretName`                      | TLS secret name for ingress                         | `chart-example-tls`              |
| `ingress.tls[0].hosts[0]`                        | TLS hosts for ingress                               | `chart-example.local`            |

