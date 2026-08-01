#!/bin/bash

set -e

export STATE_KEY=${INPUT_STATE_KEY}
export TF_STAGE=$(echo "${INPUT_TF_STAGE}" | xargs) 
export DJANGO_SECRET_KEY_PROD=${INPUT_DJANGO_SECRET_KEY_PROD}

if [[ "$TF_STAGE" == "stage1" ]]; then
    terraform -chdir=${INPUT_TF_STAGE} init -backend-config="prefix=terraform/${INPUT_STATE_KEY}/stage1"
    terraform -chdir=${INPUT_TF_STAGE} plan -out=${INPUT_TF_STAGE}.tfplan
    terraform -chdir=${INPUT_TF_STAGE} apply ${INPUT_TF_STAGE}.tfplan

elif [[ "$TF_STAGE" == "stage2" ]]; then
    terraform -chdir=${INPUT_TF_STAGE} init -backend-config="prefix=terraform/${INPUT_STATE_KEY}/stage2"
    terraform -chdir=${INPUT_TF_STAGE} apply -auto-approve -var="DJANGO_SECRET_KEY_PROD=${INPUT_DJANGO_SECRET_KEY_PROD}"

elif [[ "$TF_STAGE" == "stage3" ]]; then
    terraform -chdir=${INPUT_TF_STAGE} init -backend-config="prefix=terraform/${INPUT_STATE_KEY}/stage3"
    terraform -chdir=${INPUT_TF_STAGE} plan -out=${INPUT_TF_STAGE}.tfplan
    terraform -chdir=${INPUT_TF_STAGE} apply ${INPUT_TF_STAGE}.tfplan
fi
