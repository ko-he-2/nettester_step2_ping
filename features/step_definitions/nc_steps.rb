When(/^VPNサーバにB社のPCからnc\((\d+)\)で疎通確認$/) do |port_num|
  run "sudo ip netns exec #{@vpn_server.name} bash -c 'echo OK | nc -l #{port_num} &'"

  cd('.') do
    @b_pc.exec "nc 203.0.113.5 #{port_num} > log/nc_#{port_num}.log"
  end
end

Then(/^nc\((\d+)\)で疎通成功$/) do |port_num|
  step %(the file "log/nc_#{port_num}.log" should contain "OK")
end
