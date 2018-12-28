# Cookbook:: fai_linux_sysedge
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
include_recipe 'tar'

# Install required lib
case node['platform']
when 'redhat', 'centos', 'fedora', 'oracle'

  package %w(glibc.i686 libstdc++.i686 libstdc++ glibc psmisc) do
    action :upgrade
  end
end

# Download and extract sysedge client
tar_extract 'https://glpi.fujitsucanada.net/downloads/Linux_x86_58.tar.gz' do
  download_dir '/tmp'
  target_dir '/tmp/sysedge'
end

# Check if tmp is a mounted file system
execute 'check-tmp' do
  cwd '/tmp'
  command "mount -l | grep -E '\s/tmp\s'"
  returns [1]
end

# Make sure the file system is mounted with exec
execute 'tmp-mount-exec' do
  cwd '/tmp'
  command "mount -o remount,exec /tmp"
  only_if "exectue[check-tmp]"
end

execute 'install-sysedge' do
  cwd '/tmp/sysedge' + "/Linux_x86/CA_SystemEDGE_Core"
  command "sh ca-setup.sh /e tmp/sysedge_install.out /t EULA_ACCEPTED=1 CASE_SNMP_READ_COMMUNITY=C@unicenter3 CASE_SNMP_PORT=1691 CASE_INSTALL_DOCS=0 > /dev/null 2>&1"
end
