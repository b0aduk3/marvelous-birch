#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dbc9d70dd7fd5001a2039b1/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dbc9d70dd7fd5001a2039b1
curl -s -X POST https://api.stackbit.com/project/5dbc9d70dd7fd5001a2039b1/webhook/build/ssgbuild > /dev/null
make prepare && hugo --source demo --baseURL "/"
curl -s -X POST https://api.stackbit.com/project/5dbc9d70dd7fd5001a2039b1/webhook/build/publish > /dev/null
