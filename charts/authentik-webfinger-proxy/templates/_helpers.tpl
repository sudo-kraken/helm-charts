{{- /*
Common template helpers
*/ -}}

{{- define "authentik-webfinger-proxy.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "authentik-webfinger-proxy.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "authentik-webfinger-proxy.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "authentik-webfinger-proxy.labels" -}}
app.kubernetes.io/name: {{ include "authentik-webfinger-proxy.name" . }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "authentik-webfinger-proxy.selectorLabels" -}}
app.kubernetes.io/name: {{ include "authentik-webfinger-proxy.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "authentik-webfinger-proxy.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "authentik-webfinger-proxy.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "authentik-webfinger-proxy.image" -}}
{{- if .Values.image.sha -}}
{{ printf "%s/%s@sha256:%s" .Values.image.registry .Values.image.repository .Values.image.sha }}
{{- else -}}
{{ printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default .Chart.AppVersion .Values.image.tag) }}
{{- end -}}
{{- end -}}
