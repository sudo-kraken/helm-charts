# finances-tracker

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.1.0](https://img.shields.io/badge/AppVersion-v1.1.0-informational?style=flat-square)

finances-tracker helm chart for Kubernetes

**Homepage:** <https://github.com/sudo-kraken/finances-tracker>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Joe Harrison | <sudo-kraken@prxy.8shield.net> |  |

## Source Code

* <https://github.com/sudo-kraken/helm-charts/tree/main/charts/finances-tracker>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install

```console
helm install finances-tracker oci://ghcr.io/sudo-kraken/helm-charts/finances-tracker
```

Verify the signature with [cosign](https://docs.sigstore.dev/cosign/system_config/installation/) :

```console
cosign verify ghcr.io/sudo-kraken/helm-charts/finances-tracker:0.1.0 --certificate-identity=https://github.com/sudo-kraken/helm-charts/.github/workflows/releases.yml@refs/heads/main --certificate-oidc-issuer=https://token.actions.githubusercontent.com
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity rules for pods |
| app.containerName | string | `"finances-tracker"` | Container name |
| app.containerPort | int | `7070` | Container listen port |
| app.dbMountPath | string | `"/app/app/db"` | Mount path for the SQLite database directory |
| app.env | list | `[{"name":"XDG_CACHE_HOME","value":"/tmp/.cache"},{"name":"HOME","value":"/tmp"}]` | Extra environment variables for the container |
| extraEnv | list | `[]` | Environment variables to add to the finances-tracker pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the finances-tracker pods |
| fullnameOverride | string | `""` | Fully qualified app name override |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.registry | string | `"ghcr.io"` | Container registry |
| image.repository | string | `"sudo-kraken/finances-tracker"` | Image repository |
| image.sha | string | `""` | sha256 digest without prefix. Takes precedence over tag when set |
| image.tag | string | `""` | Overrides the image tag whose default is the chart appVersion |
| imagePullSecrets | list | `[]` | Image pull secrets |
| ingress.annotations | object | see values.yaml | Extra ingress annotations |
| ingress.enabled | bool | `false` | Enable ingress |
| ingress.hosts[0].host | string | `""` | Hostname for ingress rule |
| ingress.hosts[0].paths[0].path | string | `"/"` | Path for ingress rule |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` | Path type for ingress rule |
| ingress.className | string | `"nginx"` | IngressClass name |
| ingress.tls.enabled | bool | `true` | Enable TLS |
| ingress.tls.secretName | string | `""` | Secret name that contains the TLS certificate |
| nameOverride | string | `""` | App name override |
| nodeSelector | object | `{}` | Node selector for pods |
| persistence.annotations | object | `{}` | PVC annotations |
| persistence.enabled | bool | `true` | Enable persistent volume and mount |
| persistence.existingClaim | string | `""` | Use an existing PVC if set |
| persistence.labels | object | `{}` | PVC labels |
| persistence.size | string | `"1Gi"` | Requested storage size |
| persistence.storageClassName | string | `""` | StorageClass for the PVC |
| persistence.accessModes | list | `["ReadWriteOnce"]` | PVC access modes |
| podAnnotations | object | `{}` | Annotations for the pod |
| podLabels | object | `{}` | Extra labels for the pod |
| podSecurityContext.fsGroup | int | `10001` | Filesystem group for mounted volumes |
| podSecurityContext.fsGroupChangePolicy | string | `"OnRootMismatch"` | fsGroup change policy |
| readinessProbe.enabled | bool | `true` | Enable readiness probe |
| readinessProbe.httpGet.path | string | `"/health"` | Readiness probe path |
| readinessProbe.httpGet.port | string | `"http"` | Readiness probe port name |
| readinessProbe.initialDelaySeconds | int | `5` |  |
| readinessProbe.periodSeconds | int | `10` |  |
| readinessProbe.timeoutSeconds | int | `2` |  |
| readinessProbe.failureThreshold | int | `3` |  |
| readinessProbe.successThreshold | int | `1` |  |
| livenessProbe.enabled | bool | `true` | Enable liveness probe |
| livenessProbe.httpGet.path | string | `"/health"` | Liveness probe path |
| livenessProbe.httpGet.port | string | `"http"` | Liveness probe port name |
| livenessProbe.initialDelaySeconds | int | `10` |  |
| livenessProbe.periodSeconds | int | `10` |  |
| livenessProbe.timeoutSeconds | int | `2` |  |
| livenessProbe.failureThreshold | int | `3` |  |
| livenessProbe.successThreshold | int | `1` |  |
| startupProbe.enabled | bool | `false` | Enable startup probe |
| resources | object | `{}` | Resource requests and limits |
| replicaCount | int | `1` | Number of replicas |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.readOnlyRootFilesystem | bool | `false` |  |
| securityContext.runAsGroup | int | `10001` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.runAsUser | int | `10001` |  |
| securityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| secret.create | bool | `false` | Create a Secret from values |
| secret.name | string | `""` | Existing Secret name containing `SECRET_KEY` |
| secret.data | object | `{}` | Keys for created Secret when `secret.create` is true |
| service.annotations | object | `{}` | Extra service annotations |
| service.externalTrafficPolicy | string | `"Cluster"` | External traffic policy, useful with LoadBalancer |
| service.ipFamilyPolicy | string | `""` | Optional IP family policy |
| service.ipFamilies | list | `[]` | Optional IP families |
| service.labels | object | `{}` | Extra service labels |
| service.loadBalancerIP | string | `""` | Optional static LoadBalancer IP |
| service.port | int | `80` | Service port |
| service.targetPort | int | `7070` | Target container port |
| service.type | string | `"LoadBalancer"` | Service type |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `false` | Automatically mount a ServiceAccount token |
| serviceAccount.create | bool | `false` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | If not set and create is true, a name is generated using the fullname template |
| serviceMonitor.enabled | bool | `false` | If true, a ServiceMonitor CRD is created for a Prometheus Operator |
| serviceMonitor.interval | string | `"30s"` | Scrape interval |
| serviceMonitor.labels | object | `{}` | Extra labels for the ServiceMonitor |
| serviceMonitor.metricRelabelings | list | `[]` |  |
| serviceMonitor.namespace | string | `""` | If set, create the ServiceMonitor in an alternate namespace |
| serviceMonitor.namespaceSelector | object | `{}` | Override the namespaceSelector. Defaults to the release namespace |
| serviceMonitor.path | string | `"/metrics"` | Metrics HTTP path |
| serviceMonitor.relabelings | list | `[]` |  |
| serviceMonitor.scheme | string | `"http"` |  |
| serviceMonitor.scrapeTimeout | string | `"10s"` | Scrape timeout |
| serviceMonitor.targetLabels | list | `[]` | Labels to transfer from the Service onto the target |
| serviceMonitor.tlsConfig | object | `{}` | TLS configuration for scraping |
| tolerations | list | `[]` | Pod tolerations |

## Notes

* If `secret.create: false`, ensure a Secret named in `secret.name` exists with a `SECRET_KEY` key.
* When using an existing Longhorn PVC, set `persistence.existingClaim` and ensure permissions allow group 10001 to write.
* The ServiceMonitor requires the Prometheus Operator CRDs to be present in the cluster and the app to expose `/metrics` on the HTTP port. Adjust `serviceMonitor.path` if your endpoint differs.
