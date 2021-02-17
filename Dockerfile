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

FROM alpine:3.12

LABEL com.github.actions.name="Nancy for GitHub Actions" \
    com.github.actions.description="Run Sonatype Nancy as part of your GitHub Actions workflow."

RUN apk add --no-cache curl
# required to get grep that supports -P option
RUN apk add --no-cache --upgrade grep
RUN desiredVersion="${NANCY_VERSION}" \
    echo "desiredVersion: ${desiredVersion}" \
    if [[ ${desiredVersion} == "latest" ]] then \
      latest_version_is=$(curl --fail -s https://api.github.com/repos/sonatype-nexus-community/nancy/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")') \
      desiredVersion=${latest_version_is} \
    fi \
    sourceUrl="https://github.com/sonatype-nexus-community/nancy/releases/download/${desiredVersion}/nancy-${desiredVersion}-linux_386.apk" \
    echo "installing nancy via ${sourceUrl}" \
    curl -L -o nancy.apk ${sourceUrl} \
    apk add --no-cache --allow-untrusted nancy.apk

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
