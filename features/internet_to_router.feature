Feature: DNS疎通確認

  Fahey Inc 社内部からDNSへの疎通確認

  Scenario: DNSへの疎通確認
    Given  Internet上のPC
    When RouterにInternet上のPCからpingで疎通確認
    Then pingで疎通成功
