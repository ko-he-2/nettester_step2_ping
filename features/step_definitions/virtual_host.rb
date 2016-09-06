# coding: utf-8

Given(/^Fahey Inc 社内部のクライアント$/) do
  @int_client = Netns.new(attributes_for(:int_client))
end

Given(/^Fahey Inc 社DMZ内のDNS$/) do
  @dns_server = Netns.new(attributes_for(:dns_server))
end

Given(/^DMZ内部のサーバ$/) do
  @dmz_server = Netns.new(attributes_for(:dmz_server))
end

Given(/^Internet上のPC$/) do
  @internet_pc = Netns.new(attributes_for(:ex_network))
end

Given(/^B社のPC$/) do
  @b_pc = Netns.new(attributes_for(:b_pc))
end

Given(/^VPNサーバ$/) do
  @vpn_server = Netns.new(attributes_for(:vpn_server))
end

Given(/^Google Public DNS$/) do
  @google_dns = Netns.new(attributes_for(:ex_network))
  system "sudo ip netns exec ex_network iptables -t nat -A PREROUTING -j DNAT --to-destination 198.51.100.1"
  system "sudo ip netns exec ex_network iptables -t nat -A POSTROUTING -j SNAT --to-source 8.8.8.8"
end
