---
layout: default
title: Sintax
nav_order: 10
---

# Sintax
You can program the server in two ways:

## 1. Builder way
In the whole documentation we are using this way. It's like a builder pattern. It's fluent and expressive:
```kotlin
HttpServer(8080)
    .get("/foo") { _, res -> res.write("Hello foo") }
    .path("/api") {
      get("/user") { _, res -> res.write("Hello user") }
    }
    .start()
```

## 2. Kotlin way
We define in a lambda with receiver all the routes we need to handle. It's fluent and expressive too :)
```kotlin
HttpServer(8080) {
  get("/foo") { _, res -> res.write("Hello foo") }
  path("/api") {
    get("/user") { _, res -> res.write("Hello user") }
  }
}.start()
```
