case node['platform']
when 'oracle'
  case node['platform_version']
  when /^6/
    execute 'iptables' do
      command 'iptables -A INPUT -p udp -m udp --dport 1691 -j ACCEPT && service iptables save'
      only_if { ::File.exist?('/sbin/iptables') }
      not_if "service iptables status|grep -i 'not running'"
    end
  when /^7/
    execute 'firewall' do
      command 'firewall-cmd --zone=public --permanent --add-port=1691/udp && systemctl restart firewalld.service'
      only_if { ::File.exist?('/usr/bin/firewall-cmd') }
      not_if "firewall-cmd --state 2>&1|grep -i 'not running'"

    end
  end

end
