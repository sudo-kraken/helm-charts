# 3d-printing-cost-calculators

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.1.1](https://img.shields.io/badge/AppVersion-v1.1.1-informational?style=flat-square)

3d-printing-cost-calculators helm chart for Kubernetes

**Homepage:** <https://github.com/sudo-kraken/3d-printing-cost-calculators>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Joe Harrison | <sudo-kraken@prxy.8shield.net> |  |

## Source Code

* <https://github.com/sudo-kraken/helm-charts/tree/main/charts/3d-printing-cost-calculators>

## Requirements

Kubernetes: `>=1.23.0-0`

## Install

```console
helm install 3d-printing-cost-calculators oci://ghcr.io/sudo-kraken/helm-charts/3d-printing-cost-calculators
```

Verify the signature with [cosign](https://docs.sigstore.dev/cosign/system_config/installation/) :

```console
cosign verify ghcr.io/sudo-kraken/helm-charts/3d-printing-cost-calculators:0.1.1 --certificate-identity=https://github.com/sudo-kraken/helm-charts/.github/workflows/releases.yml@refs/heads/main --certificate-oidc-issuer=https://token.actions.githubusercontent.com
```

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | Affinity rules for pods |
| app.containerName | string | `"3d-printing-cost-calculators"` | Container name |
| app.containerPort | int | `6969` | Container listen port |
| app.env | list | `[{"name":"APP_BRAND_NAME","value":""},{"name":"APP_LOGO_URL","value":""},{"name":"APP_FAVICON_URL","value":""},{"name":"APP_DEFAULT_PROFIT_MARGIN","value":""}]` | Extra environment variables for the container |
| extraEnv | list | `[]` | Environment variables to add to the 3d-printing-cost-calculators pods |
| extraEnvFrom | list | `[]` | Environment variables from secrets or configmaps to add to the 3d-printing-cost-calculators pods |
| fullnameOverride | string | `""` | Fully qualified app name override |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.registry | string | `"ghcr.io"` | Container registry |
| image.repository | string | `"sudo-kraken/3d-printing-cost-calculators"` | Image repository |
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
| service.annotations | object | `{}` | Extra service annotations |
| service.externalTrafficPolicy | string | `""` | External traffic policy, only used when service.type is LoadBalancer or NodePort |
| service.ipFamilyPolicy | string | `""` | Optional IP family policy |
| service.ipFamilies | list | `[]` | Optional IP families |
| service.labels | object | `{}` | Extra service labels |
| service.loadBalancerIP | string | `""` | Optional static LoadBalancer IP |
| service.port | int | `80` | Service port |
| service.targetPort | int | `6969` | Target container port |
| service.type | string | `"ClusterIP"` | Service type |
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
