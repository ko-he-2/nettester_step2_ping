Feature: DNS疎通確認

  Fahey Inc 社内部からDNSへの疎通確認

  Scenario: DNSへの疎通確認
    Given  DMZ内部のサーバ
    And  Google Public DNS
    When Google Public DNSにDMZからpingで疎通確認
    Then pingで疎通成功
