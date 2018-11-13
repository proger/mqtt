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

* Purpose: High performance protocol relay for packet processing
* Endpoints: WebSockets, MQTT, MQTT-SN, TCP, UDP, CoAP via EMQ
* Codebase: 1K LOC
* Buildtools: REBAR, MAD
* Templates: DTL, NITRO
* Hosts: Cowboy, EMQ, Mochiweb
* Samples: REVIEW (1), SAMPLE (2)

Documentation
-------------

* N2O Book [PDF](http://synrc.space/apps/n2o/doc/book.pdf)

Credits
-------

* Yuri Maslovsky
* Maxim Sokhatsky
* Igor Kharin

History
-------

* 4.5 — Basic Messaging with single topic and Echo
* 4.6 — Echo eliminated Basic Filter with req/rep topics
* 4.7 — DHT supervised node for server MQTT connections
* 4.9 — Subscribe offline clients
* 4.9.3 — Cleaned n2o_async, written manpage
* 5.10 - Cleanup
* 5.11 - Formatter API changes

