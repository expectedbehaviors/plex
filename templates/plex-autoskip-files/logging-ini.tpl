{{- define "plex_autoskip_logging_ini_content" -}}
{{- $log := .Values.skip.logging | default dict }}
[loggers]
keys = root
[handlers]
keys = consoleHandler, fileHandler
[formatters]
keys = simpleFormatter, minimalFormatter
[logger_root]
level = {{ $log.rootLevel | default "DEBUG" }}
handlers = consoleHandler, fileHandler
[handler_consoleHandler]
class = StreamHandler
level = {{ $log.consoleLevel | default "INFO" }}
formatter = minimalFormatter
args = (sys.stdout,)
[handler_fileHandler]
class = handlers.RotatingFileHandler
level = {{ $log.fileLevel | default "INFO" }}
formatter = simpleFormatter
args = ('{{ $log.logFilename | default "activity.log" }}', 'a', {{ $log.fileMaxBytes | default 100000 }}, {{ $log.fileBackupCount | default 3 }}, 'utf-8')
[formatter_simpleFormatter]
format = %(asctime)s - %(name)s - %(levelname)s - %(message)s
datefmt = %Y-%m-%d %H:%M:%S
[formatter_minimalFormatter]
format = %(levelname)s - %(message)s
datefmt =
{{- end -}}
