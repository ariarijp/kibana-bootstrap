#
# Cookbook Name:: elasticsearch-bigdesk
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/var/www/html/bigdesk" do
  repository "git://github.com/lukas-vlcek/bigdesk.git"
  reference "master"
  action :sync
end
