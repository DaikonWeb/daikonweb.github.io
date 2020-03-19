---
layout: default
title: Daikon Prometheus
parent: Extensions
nav_order: 5
---

# Daikon Prometheus
Daikon Prometheus is a library that add to Daikon the ability to expose metrics for Prometheus.

## How to use

### To publish metrics:
```
HttpServer()
    .prometheus("/prometheus")
    .start().use {
        assertThat(get("http://localhost:4545/prometheus").text).contains("jvm")
    }
```

### To use a custom metric:
```
HttpServer()
    .prometheus("/prometheus")
    .get("/counter") { _, _, ctx ->
        ctx.meterRegistry().counter("calls").increment()
    }
    .start().use {
        get("http://localhost:4545/counter")
        get("http://localhost:4545/counter")
        assertThat(get("http://localhost:4545/foo").text).contains("calls_total 2.0")
    }
```

## Repository
[https://github.com/DaikonWeb/daikon-prometheus](https://github.com/DaikonWeb/daikon-prometheus)
