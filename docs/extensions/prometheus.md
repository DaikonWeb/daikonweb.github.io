---
layout: default
title: Daikon Prometheus
parent: Extensions
nav_order: 5
---

# Daikon Prometheus
Daikon Prometheus is a library that add to Daikon the ability to expose metrics for Prometheus.

## Project
[https://github.com/DaikonWeb/daikon-prometheus](https://github.com/DaikonWeb/daikon-prometheus)

## How to use

### To publish metrics:
```
@Test
fun `can publish metrics`() {
    HttpServer(5555)
        .prometheus("/foo")
        .start().use {
            assertThat("http://localhost:5555/foo".http.get().body).contains("jvm")
        }
}
```

### To use a custom metric:
```
@Test
fun `custom metrics`() {
    HttpServer(5555)
        .prometheus("/foo")
        .get("/bar") { _, _, ctx ->
            ctx.meterRegistry().counter("calls").increment()
        }
        .start().use {
            "http://localhost:5555/bar".http.get()
            "http://localhost:5555/bar".http.get()
            assertThat("http://localhost:5555/foo".http.get().body).contains("calls_total 2.0")
        }
}
```
