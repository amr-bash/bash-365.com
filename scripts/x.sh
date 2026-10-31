#!/usr/bin/env bash
# Run zer0-CMS's X lane (`manage.py x`) over this site: scripts/linkedin.sh with
# ZER0_LANE=x, so one file knows where zer0-CMS lives and which Python runs it.
#
#   scripts/x.sh status [--check]
#   scripts/x.sh draft tech/2026-10-29-some-post
#   scripts/x.sh preview 2026-10-29-some-post
#   scripts/x.sh connect --print-token
#   scripts/x.sh mcp
#
# Credentials come from the environment: X_API_KEY, X_API_SECRET,
# X_ACCESS_TOKEN, X_ACCESS_TOKEN_SECRET (.env.example).

ZER0_LANE=x exec "$(dirname "${BASH_SOURCE[0]}")/linkedin.sh" "$@"
