#
# Cookbook Name:: httpd
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
%w{iptables ip6tables}.each do |srv|
  service srv do
    action [:disable, :stop]
  end
end

package "httpd" do
  action :install
end

service "httpd" do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start]
end
