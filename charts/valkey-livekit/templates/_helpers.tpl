{{/*
Common labels
*/}}
{{- define "livekit.valkey.labels" -}}
release: {{ .Release.Name }}
application: valkey-livekit
role: master
{{- end }}

