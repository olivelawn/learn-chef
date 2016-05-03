#
# Cookbook Name:: awesome_customers_rhel
# Recipe:: web
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#Install Apache and start the service
httpd_service 'customers' do
  mpm 'prefork'
  action [:create, :start]
end

#Add the site configuration
httpd_config 'customers' do
  instance 'customers'
  source 'customers.conf.erb'
  notifies :restart, 'httpd_service[customers]'
end

#Create Docroot
directory node['awesome_customers_rhel']['document_root'] do
  recursive true
end

#Write the homepage
template "#{node['awesome_customers_rhel']['document_root']}/index.php" do
  source 'index.php.erb'
  mode '0644'
  owner node['awesome_customers_rhel']['user']
  group node['awesome_customers_rhel']['group']
end

#Install the mod_php Apache module.
httpd_module 'php' do
  instance 'customers'
end

#Install the php-mysql package
package 'php-mysql' do
  action :install
  notifies :restart, 'httpd_service[customers]'
end

