{{- /*
Common template helpers
*/ -}}

{{- define "jf-pushover-webhook.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "jf-pushover-webhook.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "jf-pushover-webhook.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "jf-pushover-webhook.labels" -}}
app.kubernetes.io/name: {{ include "jf-pushover-webhook.name" . }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "jf-pushover-webhook.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jf-pushover-webhook.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "jf-pushover-webhook.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "jf-pushover-webhook.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "jf-pushover-webhook.image" -}}
{{- if .Values.image.sha -}}
{{ printf "%s/%s@sha256:%s" .Values.image.registry .Values.image.repository .Values.image.sha }}
{{- else -}}
{{ printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default .Chart.AppVersion .Values.image.tag) }}
{{- end -}}
{{- end -}}

{{- define "jf-pushover-webhook.secretName" -}}
{{- if .Values.secret.name }}
{{- .Values.secret.name }}
{{- else }}
{{ include "jf-pushover-webhook.fullname" . }}
{{- end }}
{{- end -}}
