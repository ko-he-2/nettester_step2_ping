# frozen_string_literal: true

FactoryGirl.define do
  trait :internal_network_host do
    netmask '255.255.255.0'
    gateway '10.10.10.254'
    mac_address { Faker::Internet.mac_address('00') }
  end

  factory :ntp_client, class: Netns do
    internal_network_host

    name 'ntp_client'
    ip_address '10.10.10.3'
    virtual_port_number 2
    physical_port_number 2
  end

  # Git server and client

  factory :git_client, class: Netns do
    internal_network_host

    name 'git_client'
    ip_address '10.10.10.3'
    virtual_port_number 2
    physical_port_number 2
  end

  factory :git_server, class: Netns do
    internal_network_host

    name 'git_server'
    ip_address '10.10.10.1'
    virtual_port_number 3
    physical_port_number 3
  end

  factory :int_client, class: NetTester::Netns do
    name 'int_client'
    internal_network_host

    ip_address '10.10.10.3'
    virtual_port_number 2
    physical_port_number 2
  end

  trait :dmz_network do
    netmask '255.255.255.0'
    gateway '10.10.0.1'
    mac_address Faker::Internet.mac_address('00')
  end

  factory :dns_server, class: NetTester::Netns do
    name 'dns_server'
    dmz_network
    ip_address '10.10.0.10'
    virtual_port_number 3
    physical_port_number 3
  end

  factory :dmz_server, class: NetTester::Netns do
    name 'dmz_server'
    dmz_network
    ip_address '10.10.0.100'
    virtual_port_number 3
    physical_port_number 3
  end

  trait :external_network_server do
    netmask '255.255.255.0'
    gateway '198.51.100.254'
    ip_address '198.51.100.1'
    mac_address Faker::Internet.mac_address('00')

    virtual_port_number 4
    physical_port_number 4
  end

  factory :ex_network, class: NetTester::Netns do
    name 'ex_network'
    external_network_server
  end
end
