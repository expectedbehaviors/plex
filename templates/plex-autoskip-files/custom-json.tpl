{{- define "plex_autoskip_custom_json_content" -}}
{{- $cj := .Values.skip.customJson | default dict }}
{{- if $cj.raw }}
{{ tpl $cj.raw . }}
{{- else }}
{"markers":{},"offsets":{},"tags":{},"allowed":{"users":[],"clients":[],"keys":[],"skip-next":[]},"blocked":{"users":[],"clients":[],"keys":[],"skip-next":[]},"clients":{},"mode":{}}
{{- end }}
{{- end -}}
