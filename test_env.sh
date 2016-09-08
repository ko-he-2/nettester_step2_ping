# テスト実行前環境作成
ovs-vsctl del-br ovsbr0

ip netns add fw
ip netns add rt

ip link add name veth01 type veth peer name veth02
ip link add name veth03 type veth peer name veth04
ip link add name veth05 type veth peer name veth06
ip link add name veth07 type veth peer name veth08
ip link add name veth09 type veth peer name veth10

ip link set veth01 up
ip link set veth02 up
ip link set veth03 up
ip link set veth05 up
ip link set veth07 up

ip addr add 10.10.101.10/24 dev veth01

ip link set veth04 netns fw
ip link set veth06 netns fw
ip link set veth09 netns fw
ip link set veth08 netns rt
ip link set veth10 netns rt


ovs-vsctl add-br ovsbr0
ovs-vsctl add-port ovsbr0 veth02
ovs-vsctl add-port ovsbr0 veth03
ovs-vsctl add-port ovsbr0 veth05
ovs-vsctl add-port ovsbr0 veth07
ip addr add 10.10.101.11/24 dev ovsbr0


ovs-vsctl set bridge ovsbr0 other-config:datapath-id=0000000000000001 
ovs-vsctl set bridge ovsbr0 protocols=OpenFlow10
ovs-vsctl set-controller ovsbr0 tcp:10.10.101.10:6653

ip netns exec fw ip addr add 10.10.10.254/24 dev veth04
ip netns exec fw ip addr add 10.10.0.1/24 dev veth06
ip netns exec fw ip addr add 203.0.113.2/29 dev veth09

ip netns exec fw ip link set veth04 up
ip netns exec fw ip link set veth06 up
ip netns exec fw ip link set veth09 up

ip netns exec fw ip addr add 127.0.0.1/8 dev lo
ip netns exec fw ip link set lo up

ip netns exec fw ip route add 10.10.10.0/24 dev veth04
ip netns exec fw ip route add 10.10.0.0/24 dev veth06
ip netns exec fw ip route add default via 203.0.113.1 dev veth09


ip netns exec fw sysctl net.ipv4.ip_forward=1



ip netns exec rt ip addr add 198.51.100.254/24 dev veth08
ip netns exec rt ip addr add 203.0.113.1/29 dev veth10

ip netns exec rt ip link set veth08 up
ip netns exec rt ip link set veth10 up

ip netns exec rt ip addr add 127.0.0.1/8 dev lo
ip netns exec rt ip link set lo up

ip netns exec rt ip route add 10.10.10.0/24 via 203.0.113.2 dev veth10
ip netns exec rt ip route add 10.10.0.0/24 via 203.0.113.2 dev veth10
ip netns exec rt ip route add 203.0.113.0/29  via 203.0.113.2 dev veth10
ip netns exec rt ip route add default via 198.51.100.1 dev veth08


ip netns exec rt sysctl net.ipv4.ip_forward=1

ip netns exec rt iptables -t nat -A PREROUTING -d 203.0.113.5 -j DNAT --to 10.10.0.11






