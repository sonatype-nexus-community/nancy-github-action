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

pwd
cd $GITHUB_WORKSPACE
pwd

export GOROOT=/usr/local/go/
export PATH=$PATH:$GOROOT/bin

#/usr/local/nancy $1
/usr/local/go/bin/go list -json -m all | nancy $1
