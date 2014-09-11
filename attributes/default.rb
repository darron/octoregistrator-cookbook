# encoding: utf-8
#
# Cookbook Name:: octoregistrator
# Attributes:: default
#
# Copyright (C) 2014, Darron Froese <darron@froese.org>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['rsyslog']['port'] = 514
default['rsyslog']['protocol'] = 'udp'

default['confd']['url'] = 'https://github.com/kelseyhightower/confd/releases/download/v0.5.0/confd-0.5.0-darwin-amd64'

default['haproxy']['incoming_port'] = 8080
