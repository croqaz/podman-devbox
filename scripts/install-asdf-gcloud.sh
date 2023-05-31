#!/bin/bash

. ~/.asdf/asdf.sh
asdf plugin add gcloud
asdf install gcloud latest
asdf global gcloud latest

export CLOUDSDK_CORE_DISABLE_PROMPTS=1
gcloud components update
gcloud components install kubectl
asdf reshim gcloud
