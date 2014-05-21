# Encoding: utf-8
#
# Cookbook Name:: rax-shopware4
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
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

%w{php5 php5-curl php5-gd}.each do |pkg|
  package "#{pkg}" do
    action :install
  end
end


include_recipe 'mysql::server'
include_recipe 'apache2::default'
include_recipe 'apache2::mod_rewrite'
include_recipe 'apache2::mod_php5'


web_app "shopware" do
  server_name node['hostname']
  server_aliases [node['fqdn'], "example.com"]
  docroot "/var/www"
end
