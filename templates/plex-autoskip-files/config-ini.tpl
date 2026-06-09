{{- /*
  config.ini for PlexAutoSkip. Used by plex chart ConfigMap/Secret/ExternalSecret (not in base chart).
  Values: .Values.skip.config (plex chart).
*/ -}}
{{- define "plex_autoskip_config_ini_content" -}}
{{- $c := .Values.skip.config | default dict }}
[Plex.tv]
username = __PLEX_USERNAME__
password = __PLEX_PASSWORD__
token = __PLEX_TOKEN__
servername = {{ $c.servername | default "Plex Server" }}
[Server]
address = {{ $c.address | default "plex" }}
ssl = {{ $c.ssl | default false }}
port = {{ $c.port | default "32400" }}
[Security]
ignore-certs = {{ $c.ignoreCerts | default true }}
[Skip]
mode = {{ $c.mode | default "skip" }}
tags = {{ $c.tags | default "intro, commercial, advertisement, credits, outro, preview" }}
types = {{ $c.types | default "movie, episode" }}
ignored-libraries = {{ $c.ignoredLibraries | default "" }}
last-chapter = {{ $c.lastChapter | default "0.0" }}
unwatched = {{ $c.unwatched | default true }}
first-episode-series = {{ $c.firstEpisodeSeries | default "Watched" }}
first-episode-season = {{ $c.firstEpisodeSeason | default "Watched" }}
first-safe-tags = {{ $c.firstSafeTags | default "intro, credits" }}
last-episode-series = {{ $c.lastEpisodeSeries | default "Watched" }}
last-episode-season = {{ $c.lastEpisodeSeason | default "Watched" }}
last-safe-tags = {{ $c.lastSafeTags | default "outro, credits" }}
next = {{ $c.next | default true }}
[Binge]
ignore-skip-for = {{ $c.ignoreSkipFor | default 0 }}
safe-tags = {{ $c.safeTags | default "intro, commercial, advertisement, credits, outro, preview" }}
same-show-only = {{ $c.sameShowOnly | default false }}
skip-next-max = {{ $c.skipNextMax | default 0 }}
[Offsets]
start = {{ $c.offsetStart | default 1000 }}
end = {{ $c.offsetEnd | default 1000 }}
command = {{ $c.offsetCommand | default 500 }}
tags = {{ $c.offsetTags | default "intro" }}
[Volume]
low = {{ $c.volumeLow | default 0 }}
high = {{ $c.volumeHigh | default 100 }}
{{- end -}}

{{- define "plex_autoskip_config_ini_values" -}}
{{- $c := .Values.skip.config | default dict }}
[Plex.tv]
username = {{ $c.plexUsername | default "" }}
password = {{ $c.plexPassword | default "" }}
token = {{ $c.plexToken | default "" }}
servername = {{ $c.servername | default "Plex Server" }}
[Server]
address = {{ $c.address | default "plex" }}
ssl = {{ $c.ssl | default false }}
port = {{ $c.port | default "32400" }}
[Security]
ignore-certs = {{ $c.ignoreCerts | default true }}
[Skip]
mode = {{ $c.mode | default "skip" }}
tags = {{ $c.tags | default "intro, commercial, advertisement, credits, outro, preview" }}
types = {{ $c.types | default "movie, episode" }}
ignored-libraries = {{ $c.ignoredLibraries | default "" }}
last-chapter = {{ $c.lastChapter | default "0.0" }}
unwatched = {{ $c.unwatched | default true }}
first-episode-series = {{ $c.firstEpisodeSeries | default "Watched" }}
first-episode-season = {{ $c.firstEpisodeSeason | default "Watched" }}
first-safe-tags = {{ $c.firstSafeTags | default "intro, credits" }}
last-episode-series = {{ $c.lastEpisodeSeries | default "Watched" }}
last-episode-season = {{ $c.lastEpisodeSeason | default "Watched" }}
last-safe-tags = {{ $c.lastSafeTags | default "outro, credits" }}
next = {{ $c.next | default true }}
[Binge]
ignore-skip-for = {{ $c.ignoreSkipFor | default 0 }}
safe-tags = {{ $c.safeTags | default "intro, commercial, advertisement, credits, outro, preview" }}
same-show-only = {{ $c.sameShowOnly | default false }}
skip-next-max = {{ $c.skipNextMax | default 0 }}
[Offsets]
start = {{ $c.offsetStart | default 1000 }}
end = {{ $c.offsetEnd | default 1000 }}
command = {{ $c.offsetCommand | default 500 }}
tags = {{ $c.offsetTags | default "intro" }}
[Volume]
low = {{ $c.volumeLow | default 0 }}
high = {{ $c.volumeHigh | default 100 }}
{{- end -}}
