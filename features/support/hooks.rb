# frozen_string_literal: true

Before do
  NetTester.log_dir = File.join(Aruba.config.working_directory, 'log')
  NetTester.pid_dir = File.join(Aruba.config.working_directory, 'pids')
  NetTester.socket_dir = File.join(Aruba.config.working_directory, 'sockets')

  NetTester.run(network_device: 'veth01', physical_switch_dpid: 0x1)
  sleep(10)
end

After('@nc') do
  system 'sudo killall nc 2>/dev/null'
end

After do
  NetTester.kill
end
