#
# Cookbook Name:: chef_chef_server
# Recipe:: default
#
# 
#
# license: CC0
#
cron 'chef-backup' do
  hour '0'
  minute '0'
  command '/usr/bin/chef-server-ctl backup --yes '
end

cron 'chef-backup-rsync' do
  hour '1'
  minute '0'
  command '/usr/bin/rsync -avzhe \'ssh -p 22\' /var/opt/chef-backup/* user@remotehost.com:~/chef_bkp '
end

cron 'chef-backup-purge' do
  hour '2'
  minute '0'
  command '/usr/bin/find /var/opt/chef-backup -type f -mtime +3 -exec rm {} \; 2>/dev/null'
end

