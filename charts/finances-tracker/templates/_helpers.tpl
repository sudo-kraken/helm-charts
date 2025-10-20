{{- /*
Common template helpers
*/ -}}

{{- define "finances-tracker.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "finances-tracker.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "finances-tracker.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "finances-tracker.labels" -}}
app.kubernetes.io/name: {{ include "finances-tracker.name" . }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "finances-tracker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "finances-tracker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "finances-tracker.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "finances-tracker.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "finances-tracker.image" -}}
{{- if .Values.image.sha -}}
{{ printf "%s/%s@sha256:%s" .Values.image.registry .Values.image.repository .Values.image.sha }}
{{- else -}}
{{ printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default .Chart.AppVersion .Values.image.tag) }}
{{- end -}}
{{- end -}}

{{- define "finances-tracker.secretName" -}}
{{- if .Values.secret.create -}}
{{- default (include "finances-tracker.fullname" .) .Values.secret.name -}}
{{- else -}}
{{- required "Values.secret.name must be set when secret.create is false" .Values.secret.name -}}
{{- end -}}
{{- end -}}
