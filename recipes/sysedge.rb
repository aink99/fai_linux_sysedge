# Cookbook:: fai_linux_sysedge
# Recipe:: sysedge
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Install required lib
case node['platform']
when 'redhat', 'centos', 'fedora', 'oracle'

  package %w(glibc.i686 libstdc++.i686 libstdc++ glibc psmisc net-tools ncurses-libs.i686) do
    action :upgrade
  end
end

# Download and extract sysedge client
tar_extract node['fai_linux_sysedge']['src_url'] do
  download_dir node['fai_linux_sysedge']['download_dir']
  target_dir node['fai_linux_sysedge']['target_dir']
end



# Install the sysedge client
execute 'install-sysedge' do
  cwd node['fai_linux_sysedge']['target_dir'] + '/Linux_x86/CA_SystemEDGE_Core'
  command "sh ca-setup.sh /e /tmp/sysedge_install.out /t EULA_ACCEPTED=1 CASE_SNMP_READ_COMMUNITY=" + node['fai_linux_sysedge']['snmp_read'] + "CASE_SNMP_PORT=1691 CASE_INSTALL_DOCS=0 > /dev/null 2>&1"
end
