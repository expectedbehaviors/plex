# Plex Helm Chart

Baseline Helm chart for [Plex Media Server](https://www.plex.tv) on Kubernetes. Wraps [gabe565/plex](https://github.com/gabe565/charts/tree/main/charts/plex) with **plex-autoskip**, **autoscan** (bjw-s app-template), and optional [OnePasswordItem-helm](https://github.com/expectedbehaviors/OnePasswordItem-helm) secrets sync.

## Subcharts

| Subchart | Source | Values prefix | Description |
|----------|--------|---------------|-------------|
| **plex** | [gabe565/plex](https://github.com/gabe565/charts) | `plex.*` | Plex Media Server, ingress, persistence. |
| **skip** | [plex-autoskip-helm-chart](https://github.com/expectedbehaviors/plex-autoskip-helm-chart) | `skip.*` | Intro/credit skipping; config from Secret or ExternalSecret. |
| **autoscan** | [bjw-s app-template](https://github.com/bjw-s-labs/helm-charts) | `autoscan.*` | Library scanning sidecar; config from Secret `plex-autoscan`. |
| **onepassworditem** | [OnePasswordItem-helm](https://github.com/expectedbehaviors/OnePasswordItem-helm) | `onepassworditem.*` | Optional secrets sync into the release namespace. |

## Templates

| Template | Purpose |
|----------|---------|
| `externalSecrets.yaml` | Optional ExternalSecret for plex-autoskip config when `skip.plexAutoskipConfig.create: externalSecret` |
| `secrets.yaml` / `configMaps.yaml` | Inline plex-autoskip config when `create: secret` or `configmap` |
| `plex-autoskip-files/*.tpl` | Shared config.ini / logging.ini / custom.json content |

## Configuration

Override ingress hosts, `ADVERTISE_IP`, Plex config/media persistence (`existingClaim` or default PVC), autoscan media mounts, and `onepassworditem.items` in your private deployment values.

**Greenfield:** public defaults create a config PVC and example media PVC. **Existing PVCs:** override with `existingClaim` in your values (Argo may need `helm_skip_schema_validation: true` when deep-merging).

## Prerequisites

- Kubernetes `>=1.22`
- Default or named StorageClass (when using `storageClass: ""`)
- Ingress controller (when `plex.ingress.main.enabled: true`)
- External Secrets Operator + ClusterSecretStore (when using ExternalSecret templates)
- 1Password Connect (when using `onepassworditem.items`)

## Install

```bash
helm dependency update .
helm template release . -f values.yaml
```

## Support this project

I build tools to get the best homelab experience I can from what's available and to grow as a programmer along the way. If you'd like to contribute, donations go toward homelab operating costs and subscriptions that keep this tooling maintained. Optional and appreciated.

[![Donate with PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/donate/?business=9RHVW92WMWQNL&no_recurring=0&item_name=Optional+donations+help+support+Expected+Behaviors%E2%80%99+open+source+work.+Thank+you.&currency_code=USD)
