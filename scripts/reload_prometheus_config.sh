#!/bin/bash

set -euo pipefail

PROMETHEUS_URL="monitoring-server.thundering-ops.com"
PROMETHEUS_RULES_PATH="../IAC/ansible/roles/setup-prometheus/templates/rules.yml"

check_reload_success ()
{
  reload_result=$(curl -s http://$PROMETHEUS_URL:9090/api/v1/query\?query\=prometheus_config_last_reload_successful | jq -r '.data.result[0].value[-1]')
  if [[ "$reload_result" != 1 ]]; then
    echo "Last config reload was not succesful"
    exit 1
  fi
  echo "Last config reload was succesful"
  exit 0
}

replace_current_rule_file ()
{
  rsync --rsync-path="sudo rsync" $PROMETHEUS_RULES_PATH $PROMETHEUS_URL:/etc/prometheus/rules.yml
}

reload_prometheus_config ()
{
  ssh $PROMETHEUS_URL "sudo kill -HUP \$(pidof prometheus)"
}

replace_current_rule_file
reload_prometheus_config
check_reload_success
