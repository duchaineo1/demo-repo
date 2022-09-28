#!/bin/bash

set -eo pipefail

RECONFIGURE="$1"

export TF_VAR_tf_state_bucket="terraform-backends"
export TF_VAR_region="us-east-1"
export TF_VAR_environment="dev"
export TF_VAR_state_file_name="terraform.tfstate"

if [ -z ${RECONFIGURE+x} ]; then
    terraform init \
         -backend-config "bucket=$TF_VAR_tf_state_bucket" \
         -backend-config "region=$TF_VAR_region" \
         -backend-config "key=$TF_VAR_environment/$TF_VAR_state_file_name" \
         -backend-config "secret_key=$SPACES_SECRET_KEY" \
         -backend-config "access_key=$SPACES_ACCESS_TOKEN"
else
    terraform init -reconfigure \
         -backend-config "bucket=$TF_VAR_tf_state_bucket" \
         -backend-config "region=$TF_VAR_region" \
         -backend-config "key=$TF_VAR_environment/$TF_VAR_state_file_name" \
         -backend-config "secret_key=$SPACES_SECRET_KEY" \
         -backend-config "access_key=$SPACES_ACCESS_TOKEN"
fi
