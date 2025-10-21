{{- /*
Common template helpers
*/ -}}

{{- define "fantasy-dice-chamber.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "fantasy-dice-chamber.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := include "fantasy-dice-chamber.name" . -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "fantasy-dice-chamber.labels" -}}
app.kubernetes.io/name: {{ include "fantasy-dice-chamber.name" . }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{- define "fantasy-dice-chamber.selectorLabels" -}}
app.kubernetes.io/name: {{ include "fantasy-dice-chamber.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "fantasy-dice-chamber.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{- default (include "fantasy-dice-chamber.fullname" .) .Values.serviceAccount.name -}}
{{- else -}}
{{- default "default" .Values.serviceAccount.name -}}
{{- end -}}
{{- end -}}

{{- define "fantasy-dice-chamber.image" -}}
{{- if .Values.image.sha -}}
{{ printf "%s/%s@sha256:%s" .Values.image.registry .Values.image.repository .Values.image.sha }}
{{- else -}}
{{ printf "%s/%s:%s" .Values.image.registry .Values.image.repository (default .Chart.AppVersion .Values.image.tag) }}
{{- end -}}
{{- end -}}

{{- define "fantasy-dice-chamber.secretName" -}}
{{- if .Values.secret.name }}
{{- .Values.secret.name }}
{{- else }}
{{ include "fantasy-dice-chamber.fullname" . }}
{{- end }}
{{- end -}}
