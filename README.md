# fai_linux_sysedge

This cookbok will downloads a sysedge tarball and install it. It will install and upgrade the following packages : 'glibc.i686 libstdc++.i686 libstdc++ glibc psmisc net-tools'. It also remount /tmp . If a software firewall is running (iptables or firewalld) acl wil be added . It will not perform any actions if /etc/init.d/CA-SystemEDGE file is present.


## Requirements

### Platforms
- RHEL/Oracle/Centos 6+
- RHEL/Oracle/Centos 7+


### Chef

- Chef 13+


## Cookbook Dependencies

This cookbooks depends on the [tar](https://supermarket.chef.io/cookbooks/tar) cookbook from Chef.



## Attributes

Generally used attributes. See attributes/default.rb.

###  `fai_linux_sysedge::default`


  node['fai_linux_sysedge']['src_url'] - The source remote URL.
  
  node['fai_linux_sysedge']['download_dir'] - Directory to which tarball is downloaded.
  
  node['fai_linux_sysedge']['target_dir']  - Directory to extract into.
  
  node['fai_linux_sysedge']['snmp_read']  - Set snmp read commnunity string.
