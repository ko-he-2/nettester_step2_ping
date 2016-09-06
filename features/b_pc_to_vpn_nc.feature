Feature: DNS疎通確認

  Fahey Inc 社内部からDNSへの疎通確認

  Scenario: 80の疎通確認
    Given  B社のPC
    And VPNサーバ
    When VPNサーバにB社のPCからnc(80)で疎通確認
    And VPNサーバにB社のPCからnc(443)で疎通確認
    Then nc(80)で疎通成功
    And nc(443)で疎通成功
