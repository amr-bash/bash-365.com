#!/usr/bin/env bash
# Attach bash-365.com custom domains to the Static Web App and print the
# DNS records Azure requires. Does not change DNS. Do not guess IPs.
#
# Run AFTER the default hostname smokes (GET / and POST /api/chat).
# Attach www first, then the apex.
#
# Usage:
#   az login
#   ./infra/azure/cutover.sh
#
# Optional env:
#   AZURE_RESOURCE_GROUP        default rg-bash365-prod
#   AZURE_STATIC_WEB_APP_NAME   default swa-bash365-prod

set -euo pipefail

RG_NAME="${AZURE_RESOURCE_GROUP:-rg-bash365-prod}"
SWA_NAME="${AZURE_STATIC_WEB_APP_NAME:-swa-bash365-prod}"
WWW_HOST="www.bash-365.com"
APEX_HOST="bash-365.com"

if ! command -v az >/dev/null 2>&1; then
  echo "az CLI is required." >&2
  exit 1
fi
if ! az account show >/dev/null 2>&1; then
  echo "Not logged in. Run: az login" >&2
  exit 1
fi

DEFAULT_HOSTNAME="$(az staticwebapp show --name "$SWA_NAME" --resource-group "$RG_NAME" --query defaultHostname -o tsv)"
echo "SWA default hostname: https://${DEFAULT_HOSTNAME}"
echo "Smoke this host (index, 404, /search/, POST /api/chat) before changing DNS."
echo

attach() {
  local hostname="$1"
  echo "Attaching ${hostname}..."
  az staticwebapp hostname set \
    --name "$SWA_NAME" \
    --resource-group "$RG_NAME" \
    --hostname "$hostname" \
    --output json
  echo
}

attach "$WWW_HOST"
attach "$APEX_HOST"

echo "Current custom hostnames:"
az staticwebapp hostname list --name "$SWA_NAME" --resource-group "$RG_NAME" --output table
echo
echo "Apply EXACTLY the TXT / CNAME / ALIAS (or A) records Azure printed above."
echo "Do not guess IPs. Leave GitHub Pages enabled; rollback is reverting DNS."
echo "Do not attach bashconsultants.com in this cutover."
echo
echo "After DNS + TLS are green on https://${WWW_HOST} and https://${APEX_HOST}:"
echo "  POST /api/chat with Origin: https://${APEX_HOST} must not return 503."
