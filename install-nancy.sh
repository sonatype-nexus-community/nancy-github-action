#!/bin/sh

# Copyright (c) 2019-present Sonatype, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

acurl() {
  curl "$@"
}
if [ -n "${INPUT_GITHUBTOKEN}" ]; then
  acurl() {
    echo "using authenticated curl"
    curl -H "Authorization: Bearer ${INPUT_GITHUBTOKEN}" "$@"
  }
fi

desiredVersion="$1"
echo "desired nancy version: ${desiredVersion}"
if [ -z "$desiredVersion" ]; then
  >&2 echo "must specify a desiredVersion, like: latest or v1.0.15"
  exit 1
elif [[ ${desiredVersion} == "latest" ]]; then
  latest_version_is=$(acurl --fail -s https://api.github.com/repos/sonatype-nexus-community/nancy/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
  desiredVersion=${latest_version_is}
elif [[ ${desiredVersion:0:1} != "v" ]]; then
  >&2 echo "specific nancy version (${desiredVersion}) must start with v, like: v1.0.15"
  exit 1
fi
# installer filename excludes v from version
sourceUrl="https://github.com/sonatype-nexus-community/nancy/releases/download/${desiredVersion}/nancy_${desiredVersion:1}_linux_amd64.apk"
echo "installing nancy via ${sourceUrl}"
acurl --fail -L -o nancy.apk "${sourceUrl}"
apk add --no-progress --quiet --no-cache --allow-untrusted nancy.apk
