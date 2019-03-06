# Cookbook:: fai_linux_sysedge
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
#Print attributes
puts node['fai_linux_sysedge']['version']
puts node['fai_linux_sysedge']['force']
if node['fai_linux_sysedge']['force'] == 'true'
  include_recipe 'tar'
  if node['fai_linux_sysedge']['version'] == '58'
    include_recipe 'fai_linux_sysedge::sysedgev58'
    include_recipe 'fai_linux_sysedge::firewall'
  end
  if node['fai_linux_sysedge']['version'] == '59'
    include_recipe 'fai_linux_sysedge::sysedgev59'
    include_recipe 'fai_linux_sysedge::firewall'
  end
else  	
  # Check if installation is needed.
  unless ::File.exist?('/etc/init.d/CA-SystemEDGE')
    include_recipe 'tar'
    if node['fai_linux_sysedge']['version'] == '58'
      include_recipe 'fai_linux_sysedge::sysedgev58'
      include_recipe 'fai_linux_sysedge::firewall'
    end
    if node['fai_linux_sysedge']['version'] == '59'
      include_recipe 'fai_linux_sysedge::sysedgev59'
      include_recipe 'fai_linux_sysedge::firewall'
    end
  end
end
