Feature: DNS疎通確認

  Fahey Inc 社内部からDNSへの疎通確認

  Scenario: DNSへの疎通確認
    Given  Fahey Inc 社内部のクライアント
    And  Fahey Inc 社DMZ内のDNS
    When DNSサーバにFahey社PCからpingで疎通確認
    Then pingで疎通成功
