# Merly Mentor Kubernetes Helm Charts
#### Thank you for trying our Helm chart of Mentor!

## Usage:

### Prerequisites
This is a Helm char - you need to have Helm installed. For details on how to do that, please visit their website [Helm](https://helm.sh) 
Additionally you will need a registration key which you can get through our early access website [Merly] (https://www.merly.ai/early-access)

### Adding the Merly Mentor Helm Repository
You can add the `merly-mentor` Helm repository 

```bash
helm repo add merly-mentor https://charts.merly-mentor.ai
```
Then look for available charts
```bash
helm search repo merly-mentor
```
And finally install the chart with a release name `mentor` (but really could be anything you prefer):
```bash
helm install my-release merly-mentor/merly-mentor --set global.registrationKey="<replace-with-your-product-
```

The alternative is to download or git clone the repositry and manually install the chart 
```bash
helm install mentor ./ --set global.registrationKey="<replace-with-your-product-key"
```
The only caviat is you need to be in the right folder `charts/merly-mentor`


## Uninstalling the Chart
To uninstall/delete the `my-release` deployment:

```bash
helm uninstall merly-mentor
```
The command removes all the Kubernetes components associated with the chart and deletes the release.



The code is offered as-is without any guarantees.
<!-- 
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
| `bridge.image.repository`                        | Repository for the bridge image                     | `merlyai/bridge`                 |
| `bridge.image.tag`                               | Tag for the bridge image                            | `v0.7.2`                         |
| `bridge.containerPort`                           | Container port for the bridge service (default)     | `8080`                           |
| `mentor.nameOverride`                            | Override the name for mentor service (optional)     | `"merly-mentor"`                 |
| `mentor.replicaCount`                            | Number of replicas for the mentor service           | `1`                              |
| `mentor.image.repository`                        | Repository for the mentor image                     | `merlyai/daemon`                 |
| `mentor.image.tag`                               | Tag for the mentor image                            | `v0.7.6`                         |
| `mentor.containerPort`                           | Container port for the mentor service               | `4200`                           |
| `merlyUi.replicaCount`                           | Number of replicas for the UI service               | `1`                              |
| `merlyUi.nameOverride`                           | Override the name for UI service (optional)         | `"merly-ui"`                     |
| `merlyUi.image.repository`                       | Repository for the UI image                         | `merlyai/ui`                     |
| `merlyUi.image.tag`                              | Tag for the UI image                                | `v0.7.2`                         |
| `merlyUi.containerPort`                          | Container port for the UI service                   | `3000`                           |
| `ingress.enabled`                                | Enable or disable ingress                           | `false`                          |
| `ingress.className`                              | Class name for ingress                              | `""`                             |
| `ingress.annotations`                            | Annotations for ingress                             | `{}`                             |
| `ingress.hosts[0].host`                          | Host for ingress                                    | `chart-example.local`            |
| `ingress.hosts[0].paths[0].path`                 | Path for ingress                                    | `/`                              |
| `ingress.hosts[0].paths[0].pathType`             | Path type for ingress                               | `ImplementationSpecific`         |
| `ingress.tls[0].secretName`                      | TLS secret name for ingress                         | `merly-tls`                      |
| `ingress.tls[0].hosts[0]`                        | TLS hosts for ingress                               | `merly.local`                    |
 -->
