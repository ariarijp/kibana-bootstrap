#
# Cookbook Name:: td-agent-elasticsearch
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
directory "/var/log/httpd" do
  mode 00755
end

td_agent_gem "elasticsearch" do
  package_name "elasticsearch"
  plugin true
end

template "/etc/td-agent/td-agent.conf" do
  mode "0644"
  source "td-agent.conf.erb"
end
