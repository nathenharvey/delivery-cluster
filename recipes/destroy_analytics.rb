#
# Cookbook Name:: delivery-cluster
# Recipe:: destroy_analytics
#
# Author:: Salim Afiune (<afiune@chef.io>)
#
# Copyright:: Copyright (c) 2015 Chef Software, Inc.
# License:: Apache License, Version 2.0
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
#

include_recipe 'delivery-cluster::_settings'

# If Analytics is enabled
if is_analytics_enabled?
  begin
    # Setting the new Chef Server we just created
    with_chef_server chef_server_url,
      client_name: 'delivery',
      signing_key_filename: "#{cluster_data_dir}/delivery.pem"

    # Destroy Analytics Server
    machine analytics_server_hostname do
      action :destroy
    end

    # Delete the lock file
    File.delete(analytics_lock_file)
  rescue Exception => e
    Chef::Log.warn("We can't proceed to destroy the Analytics Server.")
    Chef::Log.warn("We couldn't get the chef-server Public IP: #{e.message}")
  end
else
  Chef::Log.warn("You must provision an Analytics Server before be able to")
  Chef::Log.warn("destroy it. READ => delivery-cluster/setup_analytics.rb")
end
