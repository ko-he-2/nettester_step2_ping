Feature: DNS疎通確認

  Fahey Inc 社内部からDNSへの疎通確認

  Scenario: DNSへの疎通確認
    Given  B社のPC
    And VPNサーバ
    When VPNサーバにB社のPCからpingで疎通確認
    Then pingで疎通成功
