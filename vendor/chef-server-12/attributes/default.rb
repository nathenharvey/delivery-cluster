#
# Cookbook Name:: chef-server-12
# Attributes:: default
#
# Author:: Salim Afiune (<afiune@chef.io>)
#
# Copyright 2015, Chef Software, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Chef Server Version
default['chef-server-12']['version']       = 'latest'

# Plugins / Feautures
#
# To Install plugins into the Chef-Server simply enable them setting the value `true`
# If there is more plugins you just need to add them as follow:
# => default['chef-server-12']['plugin']['PLUGIN_NAME'] = true
default['chef-server-12']['plugin']['opscode-manage']            = true
default['chef-server-12']['plugin']['opscode-reporting']         = true
default['chef-server-12']['plugin']['opscode-push-jobs-server']  = true
default['chef-server-12']['plugin']['chef-sync']                 = false

# Chef Server Parameters
default['chef-server-12']['api_fqdn'] = node['ipaddress']
default['chef-server-12']['topology'] = "standalone"

# Analytics Server Parameters
default['chef-server-12']['analytics'] = nil

# Delivery Server
#
# This section is dedicated to setup the basic requirements for delivery-server
# to work. If you do not need this configuration you just need to:
# => Set ['chef-server-12']['delivery_setup'] to `false`
#
# This process includes:
# => Create an organization
# => Create the delivery user
# => Save keys into the server and/or a databag. (['chef-server-12']['store_keys_databag'])
#
# TODO: Figure out how to make delivery user an admin (tricky)
default['chef-server-12']['delivery_setup']            = true
default['chef-server-12']['store_keys_databag']        = true
default['chef-server-12']['delivery']['ssl']           = true
default['chef-server-12']['delivery']['organization']  = "chef_delivery"
default['chef-server-12']['delivery']['org_longname']  = "\"Chef Continuous Delivery\""
default['chef-server-12']['delivery']['user']          = "delivery"
default['chef-server-12']['delivery']['name']          = "Delivery"
default['chef-server-12']['delivery']['last_name']     = "User"
default['chef-server-12']['delivery']['email']         = "delivery@getchef.com"
default['chef-server-12']['delivery']['password']      = "delivery"
default['chef-server-12']['delivery']['validator_pem'] = "/tmp/validator.pem"
default['chef-server-12']['delivery']['delivery_pem']  = "/tmp/delivery.pem"
default['chef-server-12']['delivery']['db']            = "delivery"
default['chef-server-12']['delivery']['item']          = "delivery_pem"