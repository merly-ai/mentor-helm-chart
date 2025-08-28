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

{{/*
Bridge container image
Used by the bridge sidecar container in mentor deployment
*/}}
{{- define "bridge.deployment.image" -}}
{{- if and .Values.bridge .Values.bridge.image .Values.bridge.image.repository .Values.bridge.image.tag -}}
{{- printf "%s:%s" .Values.bridge.image.repository .Values.bridge.image.tag }}
{{- else -}}
{{- fail "A valid repository and tag are required! Ensure .Values.bridge.image.repository, and .Values.bridge.image.tag are properly set." -}}
{{- end -}}
{{- end -}}

{{/*
Bridge service name
*/}}
{{- define "bridge.service.name" -}}
{{- if and .Values.bridge .Values.bridge.service .Values.bridge.service.nameOverride -}}
{{- .Values.bridge.service.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- "merly-bridge" }}
{{- end }}
{{- end }}

{{/*
Mentor deployment name
*/}}
{{- define "mentor.deployment.name" -}}
{{- if and .Values.mentor .Values.mentor.nameOverride -}}
{{- .Values.mentor.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- "merly-mentor" }}
{{- end }}
{{- end }}

{{/*
Mentor labels
*/}}
{{- define "mentor.labels" -}}
{{ include "merly-mentor.commonLabels" . }}
app.kubernetes.io/name: {{ include "mentor.deployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
merly.service.name: mentor
merly.app.name: mentor
{{- end }}

{{/*
Mentor service name
*/}}
{{- define "mentor.service.name" -}}
{{- if and .Values.mentor .Values.mentor.service .Values.mentor.service.nameOverride -}}
{{- .Values.mentor.service.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- "merly-mentor" }}
{{- end }}
{{- end }}

{{/*
Mentor container image
*/}}
{{- define "mentor.deployment.image" -}}
{{- if and .Values.mentor .Values.mentor.image .Values.mentor.image.repository .Values.mentor.image.tag -}}
{{- printf "%s:%s" .Values.mentor.image.repository .Values.mentor.image.tag }}
{{- else -}}
{{- fail "A valid repository and tag are required! Ensure .Values.mentor.image.repository, and .Values.mentor.image.tag are properly set." -}}
{{- end -}}
{{- end -}}

{{/*
UI deployment name
*/}}
{{- define "merlyUi.deployment.name" -}}
{{- if and .Values.merlyUi .Values.merlyUi.nameOverride -}}
{{- .Values.merlyUi.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- "merly-ui" }}
{{- end }}
{{- end }}

{{/*
UI labels
*/}}
{{- define "merlyUi.labels" -}}
{{ include "merly-mentor.commonLabels" . }}
app.kubernetes.io/name: {{ include "merlyUi.deployment.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
merly.service.name: merly-ui
merly.app.name: merly-ui
{{- end }}

{{/*
UI service name
*/}}
{{- define "merlyUi.service.name" -}}
{{- if and .Values.merlyUi .Values.merlyUi.service .Values.merlyUi.service.nameOverride -}}
{{- .Values.merlyUi.service.nameOverride | trunc 63 | trimSuffix "-" }}
{{- else -}}
{{- "merly-ui" }}
{{- end }}
{{- end }}

{{/*
UI container image
*/}}
{{- define "merlyUi.deployment.image" -}}
{{- if and .Values.merlyUi .Values.merlyUi.image .Values.merlyUi.image.repository .Values.merlyUi.image.tag -}}
{{- printf "%s:%s" .Values.merlyUi.image.repository .Values.merlyUi.image.tag }}
{{- else -}}
{{- fail "A valid repository and tag are required! Ensure .Values.merlyUi.image.repository, and .Values.merlyUi.image.tag are properly set." -}}
{{- end -}}
{{- end -}}