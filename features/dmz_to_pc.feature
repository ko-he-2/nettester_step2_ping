Feature: DNS疎通確認

  Fahey Inc 社内部からDNSへの疎通確認

  Scenario: DNSへの疎通確認
    Given  DMZ内部のサーバ
    And  Fahey Inc 社内部のクライアント
    When Fahey Inc 社内部のクライアントにDMZからpingで疎通確認
    Then pingで疎通成功
