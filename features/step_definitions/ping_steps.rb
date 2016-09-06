# coding: utf-8

When(/^DNSサーバにFahey社PCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @int_client.exec 'ping 10.10.0.10 -c 4 > log/ping.log'
  end
end

When(/^Fahey Inc 社内部のクライアントにDMZからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @dmz_server.exec 'ping 10.10.10.3 -c 4 > log/ping.log'
  end
end

When(/^Google Public DNSにFahey社PCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @int_client.exec 'ping 8.8.8.8 -c 4 > log/ping.log'
  end
end

When(/^Google Public DNSにDMZからpingで疎通確認$/) do
system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @dmz_server.exec 'ping 8.8.8.8 -c 4 > log/ping.log'
  end
end

When(/^DMZにFahey社PCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @int_client.exec 'ping 10.10.0.100 -c 4 > log/ping.log'
  end
end

When(/^VPNサーバにInternet上のPCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.5 -c 4 > log/ping.log'
  end
end

When(/^RouterにInternet上のPCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.1 -c 4 > log/ping.log'
  end
end


When(/^FirewallにInternet上のPCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD" 
  cd('.') do
    @internet_pc.exec 'ping 203.0.113.2 -c 4 > log/ping.log'
  end
end

When(/^VPNサーバにB社のPCからpingで疎通確認$/) do
  system "sudo ovs-ofctl add-flow test_0xdad1c001 dl_dst=ff:ff:ff:ff:ff:ff,actions=output:FLOOD"
  cd('.') do
    @b_pc.exec 'ping 203.0.113.5 -c 4 > log/ping.log'
  end
end



Then(/^pingで疎通成功$/) do
  step %(the file "log/ping.log" should contain "0%")
end
