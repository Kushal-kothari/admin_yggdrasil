# erldrasil -  Yggdrasil Unix Client Library in Erlang

**Version: 0.1.0**

**erldrasil is a yggdrasil unix client library written to  query and configure Yggdrasil during runtime in Erlang**

Yggdrasil is an early-stage implementation of a fully end-to-end encrypted IPv6 network. It is lightweight, self-arranging, supported on multiple platforms and allows pretty much any IPv6-capable application to communicate securely with other Yggdrasil nodes. Yggdrasil does not require you to have IPv6 Internet connectivity - it also works over IPv4.



To run the application simply run 'rebar3 shell'.




# Connect
The admin socket provides an interface to query and configure Yggdrasil during runtime.
Before performing any query you need to start the connection with the yggdrasil socket.

```erlang
yggdrasil_client:start().
```

### Simple request

Do a simple request of NodeInfo with three parameters


* Request  
* Key  
* Coords

It will ask a remote node to respond with their nodeinfo.

```erlang

 yggdrasil_client:getNodeInfo("getNodeInfo","401cbe86874114d3e5ff894e66b3eb063592b9b4dc7bb9139c98b28686899242","[1 15 15]").

{
  "request": {
    "box_pub_key": "401cbe86874114d3e5ff894e66b3eb063592b9b4dc7bb9139c98b28686899242",
    "coords": "[1 15 15]",
    "request": "getNodeInfo"
  },
  "response": {
    "nodeinfo": {
      "buildarch": "amd64",
      "buildname": "yggdrasil-develop",
      "buildplatform": "linux", 
      "buildversion": "0.3.14-0036",
      "name": "pl1.servers.devices.y.cwinfo.net"
    }
  },
  "status": "success"
}
ok

```

```erlang
2> yggdrasil_erlang:yggrequest("getPeers").                                                                                   
{
  "request": {
    "baz": "qux",
    "request": "getPeers",
    "uri": "foo"
  },
  "response": {
    "peers": {
      "201:6a49:40cc:c40e:db1c:33d0:bb14:93ec": {
        "box_pub_key": "120915e044fb981b4681448072079592bf92dadd2c1256d35f1e1d4e480d2e2e",
        "bytes_recvd": 1399041,
        "bytes_sent": 230535,
        "endpoint": "tcp://85.17.15.221:35239",
        "port": 2,
        "proto": "tcp",
        "uptime": 8717.542262283
      },
      "203:18f0:c3bb:cd12:66d2:bb08:ce8d:9fde": {
        "box_pub_key": "64735dcf73c1afa1fde9a8b238077b2dcc474adf42cfa55b5ccfa90ddb1ce011",
        "bytes_recvd": 1790172,
        "bytes_sent": 2831669,
        "endpoint": "(self)",
        "port": 0,
        "proto": "self",
        "uptime": 8957.972711731
      },
      "204:4738:37c6:d295:1b34:2722:62dd:e8de": {
        "box_pub_key": "15bfab4e09218e033bd7feb290e9d4991dbe99f064e606f1718c27568dbb5d71",
        "bytes_recvd": 758488,
        "bytes_sent": 397602,
        "endpoint": "tls://212.129.52.193:39575",
        "port": 3,
        "proto": "tls",
        "uptime": 8717.387277387
      }
    }
  },
  "status": "success"
}
ok
```

# To ask a remote node to respond with their nodeinfo.

```erlang
3> yggdrasil_client:dhtPing("dhtPing","8016d5909c8c5d3da913b29ed2334210296dfa4c0fa09af55df182d6b9171e17", "[1 8 4 23]","last_seen").
{
  "request": {
    "box_pub_key": "8016d5909c8c5d3da913b29ed2334210296dfa4c0fa09af55df182d6b9171e17",
    "coords": "[1 8 4 23]",
    "request": "dhtPing",
    "target": "last_seen"
  },
  "response": {
    "nodes": {
      "200:fd17:ce0a:e6d:6ba9:43b0:c6d6:7162": {
        "box_pub_key": "4bd13308a14298a11356c71b48f8fe9ad200d7e79beee3b0ea974a2df8fd6871",
        "coords": "[1 93 92]"
      },
      "200:fd73:2ed4:7b96:d0bc:a69f:53d7:a6fc": {
        "box_pub_key": "4e8fa0b6e9c68bdd1e13da43253bafc22126b9bba31fc5111ecee93d8b066650",
        "coords": "[1 15 18 57]"
      },
      "200:fdd3:b119:f6fc:139a:f3ea:1f7c:99a8": {
        "box_pub_key": "828492ec09b3a52808dc01c6976c041f0f4062f93c74ec451f96ac100d6e5126",
        "coords": "[1 8 4 127]"
      },
      "200:fdff:9e8e:aac8:57dc:4924:adcc:ae81": {
        "box_pub_key": "eec0ba286e72561664f53605a08c836bd1ba86f0287798b398fddedf757ebf75",
        "coords": "[1 38 171]"
      },
      "200:fe44:131b:66bd:580d:569b:760:e8c0": {
        "box_pub_key": "cb00b9c2c304d1a5e7503335eae5121eb4a3d091bcf10c0919db388fa9353b0f",
        "coords": "[1 8 4 42]"
      },
      "200:fece:2fbe:7153:43ed:5155:2218:2297": {
        "box_pub_key": "55fc83fc5a85f4583d1348a7349e93974a15ca62b05e0dd428efa0ea5c649f30",
        "coords": "[1 59 2]"
      },
      "201:5730:f92b:e2b7:6b04:2058:f4a2:6e3d": {
        "box_pub_key": "8c1c140a39a2d9585b577075eb878b33042b0796854db5005142211838db9b2f",
        "coordsok
```