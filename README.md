N2O: Distributed Application Server
===================================

[![Build Status](https://travis-ci.org/synrc/mqtt.svg?branch=master)](https://travis-ci.org/synrc/mqtt)

N2O is a embeddable message protocol loop library for
WebSocket, HTTP, MQTT and TCP servers. It provides basic
features, such as: process management; virtual nodes ring for
request processing; session, encoding, mq, cache and log services.
It also includes poor man's bridges to server's endpoints.

Features
--------

* Purpose: High performance protocol relay
* Endpoints: WebSockets, MQTT, TCP
* Codebase: 1K LOC
* Buildtools: REBAR, MAD
* Templates: DTL, NITRO
* Hosts: COWBOY, EMQ, MOCHIWEB
* Samples: REVIEW (1), SAMPLE (2)

The Idea
--------

N2O was created to bring clarity and sanity to software development.
The distribution model is per file basis with ISC license.

Core
----

The core modules provide OTP start and N2O entry point.

* [n2o](https://mqtt.n2o.space/man/n2o.htm) — N2O OTP Supervisor and Application
* [n2o_async](https://mqtt.n2o.space/man/n2o_async.htm) — N2O Async Processes
* [n2o_proto](https://mqtt.n2o.space/man/n2o_proto.htm) — N2O Loop

MQTT
----

MQTT version is implemented as RPC over MQ pattern.
N2O service worker started as ring of virtual nodes each runs N2O loop.

* [n2o_vnode]() — N2O Virtual Node
* [n2o_auth]() — N2O Auth
* [n2o_ring]() — N2O Ring

```
$ mad app mqtt review
$ cd review
$ mad dep com pla rep
$ open http://127.0.0.1:8000
```

WebSocket
---------

N2O Loop is directly connected and runned inside context of WebSocket handler.
Usually in Erlang we use `syn` or `gproc` OTP message buses. As such buses are
optional in MQTT setup we include bus drivers in WebSocket package.

* [n2o_stream](https://mqtt.n2o.space/man/n2o_stream.htm) — N2O cowboy WebSocket backend
* [n2o_static]() — N2O cowboy WebSocket backend — N2O cowboy HTTP static backend
* [n2o_cowboy]() — N2O cowboy HTTP backend
* [n2o_gproc]() — GPROC bus backend
* [n2o_syn]() — SYN bus backend

```
$ mad app web sample
$ cd sample
$ mad dep com pla rep
$ open http://127.0.0.1:8001
```

Protocols
---------

N2O is shipped with 3 protocols, which could be omited or extended.

* [n2o_nitro](https://mqtt.n2o.space/man/n2o_nitro.htm) — N2O Nitrogen web framework protocol
* [n2o_ftp](https://mqtt.n2o.space/man/n2o_ftp.htm) — N2O File protocol
* [n2p_heart](https://mqtt.n2o.space/man/n2o_heart.htm) — N2O Heart protocol

Services
--------

Formatters, Loggers, Sessions, etc.

* [n2o_bert]() — BERT encoder/decoder
* [n2o_json]() — JSON encoder/decoder
* [n2o_secret]()  — AES/CBC-128 encoder/decoder
* [n2o_session]() — ETS session backend
* [n2o_io]() — IO loger backend

Literature
----------

* N2O Book [PDF](http://synrc.com/apps/n2o/doc/book.pdf)

Credits
-------

* Maxim Sokhatsky — core, shen, windows
* Dmitry Bushmelev — endpoints, yaws, cowboy
* Andrii Zadorozhnii — elements, actions, handlers
* Vladimir Kirillov — mac, bsd, xen, linux support
* Andrey Martemyanov — binary protocols
* Oleksandr Nikitin — security
* Anton Logvinenko — doc
* Roman Shestakov — advanced elements, ct
* Jesse Gumm — nitrogen, help
* Yuri Maslovsky — mqtt
* Igor Kharin — k8s, ekka
* Rusty Klophaus — original author

History
-------

* 4.5 — Basic Messaging with single topic and Echo
* 4.6 — Echo eliminated Basic Filter with req/rep topics
* 4.7 — DHT supervised node for server MQTT connections
* 4.9 — Subscribe offline clients
* 4.9.3 — Cleaned n2o_async, written manpage
* 5.10 — Cleanup
* 5.11 — Formatter API changes
* 5.11.1 — Unification of WebSocket and MQTT versions
