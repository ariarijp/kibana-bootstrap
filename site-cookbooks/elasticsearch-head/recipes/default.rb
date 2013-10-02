#
# Cookbook Name:: elasticsearch-head
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/var/www/html/head" do
  repository "git://github.com/mobz/elasticsearch-head.git"
  reference "master"
  action :sync
end
