#
# Cookbook Name:: elasticsearch
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

eth1_ipaddr = nil
node["network"]["interfaces"]["eth1"]["addresses"].each do |ip, params|
  if params['family'] == ('inet')
    eth1_ipaddr = ip
  end
end

es_rpm = "elasticsearch-0.90.5.noarch.rpm"
es_url = "https://download.elasticsearch.org/elasticsearch/elasticsearch/#{es_rpm}"

package "java-1.7.0-openjdk" do
  action :install
end

remote_file "/tmp/#{es_rpm}" do
  source es_url

  if File.exists? "/tmp/#{es_rpm}"
    action :nothing
  end
end

package "elasticsearch" do
  action :install
  provider Chef::Provider::Package::Rpm
  source "/tmp/#{es_rpm}"
end 

service "elasticsearch" do
  action :nothing
  supports :status => true, :start => true, :stop => true, :restart => true
end

bash "add_cluster_name" do
  user "root"

  code <<-EOH
  if ! grep "cluster.name: kibana" /etc/elasticsearch/elasticsearch.yml ; then
    echo "cluster.name: kibana" >> /etc/elasticsearch/elasticsearch.yml
  fi

  if ! grep "network.host: #{eth1_ipaddr}" /etc/elasticsearch/elasticsearch.yml ; then
    echo "network.host: #{eth1_ipaddr}" >> /etc/elasticsearch/elasticsearch.yml
  fi
  EOH

  notifies :restart, resources(:service => "elasticsearch")
end
