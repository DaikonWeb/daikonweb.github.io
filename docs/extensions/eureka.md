---
layout: default
title: Daikon Eureka
parent: Extensions
nav_order: 4
---

# Daikon Eureka
Daikon Eureka is a library that add to Daikon the ability to publish on an Eureka Server and discover other services.

## How to use

### To publish your service:
```
HttpServer()
    .initDiscoveryClient()
    .start()
```

### To discover a service:
```
HttpServer()
    .initDiscoveryClient()
    .get("/") { _, _, ctx ->
        val service = ctx.discoveryClient().getNextServerFromEureka("onion", false)
    }
    .start()
```

## For more informations go to the Project README
[https://github.com/DaikonWeb/daikon-eureka](https://github.com/DaikonWeb/daikon-eureka)
