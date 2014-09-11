# encoding: utf-8
#
# Cookbook Name:: octoregistrator
# Recipe:: default
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

include_recipe 'chef-sugar::default'

include_recipe 'rsyslog::server'

include_recipe 'consul::default'

include_recipe 'confd::default'

include_recipe 'haproxy::default'

remote_file '/usr/local/bin/consul-haproxy' do
  source 'https://github.com/hashicorp/consul-haproxy/releases/download/v0.1.0/consul-haproxy_linux_amd64'
  owner 'root'
  group 'root'
  mode 00755
  not_if { File.exist?('/usr/local/bin/consul-haproxy') }
end

bash 'pull registrator' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    docker pull progrium/registrator
  EOH
  not_if 'docker images | grep registrator'
end

bash 'pull nginx' do
  user 'root'
  cwd '/tmp'
  code <<-EOH
    docker pull octohost/nginx
  EOH
  not_if 'docker images | grep nginx'
end

docker_container 'progrium/logspout' do
  detach true
  volume '/var/run/docker.sock:/tmp/docker.sock'
  command 'syslog://127.0.0.1:514'
end
