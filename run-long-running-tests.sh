#!/bin/bash -e
# Copyright (c) 2019, WSO2 Inc. (http://wso2.org) All Rights Reserved.
#
# WSO2 Inc. licenses this file to you under the Apache License,
# Version 2.0 (the "License"); you may not use this file except
# in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

timeInDays=7
time=$(expr $timeInDays \* 24 \* 60 \* 60)
#time=7200
concurrency=2
host=3.235.175.44
port=30443
constantTPS=4 # per minute
start_time=$(date +"%s")

result_dir=/home/ubuntu/long-run
jmeter_scrip_home=/home/ubuntu/workspace/jmeter
JMETER_HOME=/home/ubuntu/apache-jmeter-3.3
export PATH=$PATH:$JMETER_HOME/bin
mkdir -p $result_dir

echo "Starting long running test with params,"
echo "      time: $(expr $time / 60 / 60 / 24) days"
echo "      concurrency: $concurrency"
echo "      host: $host"
echo "      port: $port"
echo "============================================"

nohup jmeter -Jconcurrency=$concurrency -Jtime=$time -Jhost=$host -Jport=$port -JconstantTPS=$constantTPS -n -l $result_dir/OAuth_AuthCode_Redirect_WithConsent.jtl \
    -t $jmeter_scrip_home/oauth/OAuth_AuthCode_Redirect_WithConsent.jmx > $result_dir/OAuth_AuthCode_Redirect_WithConsent.out &

echo ""
echo "Test started successfully"
