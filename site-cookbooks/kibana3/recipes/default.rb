#
# Cookbook Name:: kibana3
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
filename = "kibana-latest.tar.gz"
remote_uri = "http://download.elasticsearch.org/kibana/kibana/kibana-latest.tar.gz"
install_dir = "/var/www/html"

remote_file "/tmp/#{filename}" do
  source remote_uri
end

script "install_kibana3" do
  interpreter "bash"
  user        "root"
  code <<-EOL
    tar xzf /tmp/#{filename} -C #{install_dir}
    mv #{install_dir}/kibana-latest #{install_dir}/kibana
    cat /var/www/html/kibana/config.js | sed s/\\"+window.location.hostname+\\"/192.168.50.101/ > /var/www/html/kibana/config.js.tmp
    mv /var/www/html/kibana/config.js /var/www/html/kibana/config.js.orig
    mv /var/www/html/kibana/config.js.tmp /var/www/html/kibana/config.js
  EOL
end