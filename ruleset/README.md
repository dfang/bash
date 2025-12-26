

## 代理组

在订阅上右键，"Edit Proxy Groups" 新增一些代理组（按国家）


## Global Extend Config 里添加rule-providers

rule-providers:
  google-rules:
    type: http
    behavior: domain
    url: "https://fastly.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/google.txt"
    path: ./ruleset/google.yaml
    interval: 86400

  proxy-rules:
    type: http
    behavior: domain
    url: "https://fastly.jsdelivr.net/gh/Loyalsoldier/clash-rules@release/proxy.txt"
    path: ./ruleset/proxy.yaml
    interval: 86400

  Youtube:
    type: http
    behavior: classical
    url: 'https://raw.githubusercontent.com/dfang/bash/refs/heads/master/ruleset/Youtube.txt'
    path: ./ruleset/Youtube.yaml
    interval: 86400

  Crypto:
    type: file
    behavior: classical
    path: ./ruleset/Crypto.yaml

prepend-rules:
  - RULE-SET,Youtube,DIRECT
  - RULE-SET,Crypto,日本