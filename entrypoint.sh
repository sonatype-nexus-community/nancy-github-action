#!/bin/sh -l

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

echo "entrypoint NANCY_VERSION: ${NANCY_VERSION}"
echo "entrypoint INPUT_NANCYVERSION: ${INPUT_NANCYVERSION}"

pwd
ls -alh
ls -alh /
/install-nancy.sh $INPUT_NANCYVERSION

nancy $2 < $1
