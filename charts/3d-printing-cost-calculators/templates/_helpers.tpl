{{- /*
Common template helpers
*/ -}}

{{- define "3d-printing-cost-calculators.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "3d-printing-cost-calculators.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "3d-printing-cost-calculators.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "3d-printing-cost-calculators.labels" -}}
app.kubernetes.io/name: {{ include "3d-printing-cost-calculators.name" . }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "3d-printing-cost-calculators.selectorLabels" -}}
app.kubernetes.io/name: {{ include "3d-printing-cost-calculators.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "3d-printing-cost-calculators.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "3d-printing-cost-calculators.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "3d-printing-cost-calculators.image" -}}
{{- if .Values.image.sha -}}
{{ printf "%s/%s@sha256:%s" .Values.image.registry .Values.image.repository .Values.image.sha }}
{{- else -}}
{{ printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default .Chart.AppVersion .Values.image.tag) }}
{{- end -}}
{{- end -}}
