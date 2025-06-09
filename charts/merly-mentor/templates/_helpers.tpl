{{/*
Expand the name of the chart.
*/}}
{{- define "merly-mentor.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "merly-mentor.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "merly-mentor.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "merly-mentor.commonLabels" -}}
helm.sh/chart: {{ include "merly-mentor.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}



{{/* -------------bridge------------------ */}}
{{/* -------------bridge------------------ */}}
{{/* -------------bridge------------------ */}}

{{- define "bridge.deployment.name" -}}
{{- if and .Values.bridge .Values.bridge.nameOverride -}}
{{ .Values.bridge.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ "merly-bridge" }}
{{- end }}
{{- end }}


{{- define "bridge.deployment.image" -}}
{{- if and .Values.bridge .Values.bridge.image .Values.bridge.image.repository .Values.bridge.image.tag -}}
  "{{ .Values.bridge.image.repository }}:{{ .Values.bridge.image.tag }}"
{{- else -}}
  {{- fail "A valid repository and tag are required! Ensure .Values.bridge.image.repository, and .Values.bridge.image.tag are properly set." -}}
{{- end -}}
{{- end -}}


{{- define "bridge.labels" -}}
{{ include "merly-mentor.commonLabels" . }}
merly.service.name: bridge
merly.app.name: bridge
{{- end }}

{{- define "bridge.service.name" -}}
{{- if and .Values.bridge .Values.bridge.service .Values.bridge.service.nameOverride -}}
{{ .Values.bridge.service.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ "merly-bridge" }}
{{- end }}
{{- end }}


{{/* -------------mentor------------------ */}}
{{/* -------------mentor------------------ */}}
{{/* -------------mentor------------------ */}}

{{- define "mentor.labels" -}}
{{ include "merly-mentor.commonLabels" . }}
merly.service.name: mentor
merly.app.name: mentor
{{- end }}


{{- define "mentor.deployment.name" -}}
{{- if and .Values.mentor .Values.mentor.nameOverride -}}
{{ .Values.mentor.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ "merly-mentor" }}
{{- end }}
{{- end }}

{{- define "mentor.service.name" -}}
{{- if and .Values.mentor .Values.mentor.service .Values.mentor.service.nameOverride -}}
{{ .Values.mentor.service.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ "merly-mentor" }}
{{- end }}
{{- end }}






{{- define "mentor.deployment.image" -}}
{{- if and .Values.mentor .Values.mentor.image .Values.mentor.image.repository .Values.mentor.image.tag -}}
  "{{ .Values.mentor.image.repository }}:{{ .Values.mentor.image.tag }}"
{{- else -}}
  {{- fail "A valid repository and tag are required! Ensure .Values.mentor.image.repository, and .Values.mentor.image.tag are properly set." -}}
{{- end -}}
{{- end -}}


{{/* -------------ui------------------ */}}
{{/* -------------ui------------------ */}}
{{/* -------------ui------------------ */}}

{{- define "merlyUi.labels" -}}
{{ include "merly-mentor.commonLabels" . }}
merly.service.name: merly-ui
merly.app.name: merly-ui
{{- end }}


{{- define "merlyUi.deployment.name" -}}
{{- if and .Values.merlyUi .Values.merlyUi.nameOverride -}}
{{ .Values.merlyUi.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ "merly-ui" }}
{{- end }}
{{- end }}

{{- define "merlyUi.service.name" -}}
{{- if and .Values.merlyUi .Values.merlyUi.service .Values.merlyUi.service.nameOverride -}}
{{ .Values.merlyUi.service.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{ "merly-ui" }}
{{- end }}
{{- end }}

{{- define "merlyUi.deployment.image" -}}
{{- if and .Values.merlyUi .Values.merlyUi.image .Values.merlyUi.image.repository .Values.merlyUi.image.tag -}}
  "{{ .Values.merlyUi.image.repository }}:{{ .Values.merlyUi.image.tag }}"
{{- else -}}
  {{- fail "A valid repository and tag are required! Ensure .Values.merlyUi.image.repository, and .Values.merlyUi.image.tag are properly set." -}}
{{- end -}}
{{- end -}}


