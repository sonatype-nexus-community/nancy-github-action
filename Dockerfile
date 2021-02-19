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

FROM alpine:3.13

LABEL com.github.actions.name="Nancy for GitHub Actions" \
    com.github.actions.description="Run Sonatype Nancy as part of your GitHub Actions workflow."

# required to fetch nancy.apk via curl
RUN apk add --no-cache curl

# required to get grep that supports -P option
RUN apk add --no-cache --upgrade grep

COPY install-nancy.sh /install-nancy.sh

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
