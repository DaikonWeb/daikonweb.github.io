---
layout: default
title: Syntax
nav_order: 100
---

# Syntax
You can program the server in two ways:

## 1. Builder way
In the whole documentation we are using this approach. It's like a builder pattern. It's fluent and expressive:
```kotlin
HttpServer(8080)
    .get("/foo") { _, res -> res.write("Hello foo") }
    .path("/api") {
      get("/user") { _, res -> res.write("Hello user") }
    }
    .start()
```

## 2. Kotlin way
We define all the routes we need to handle in a lambda with receiver. It's fluent and expressive too :)
```kotlin
HttpServer(8080) {
  get("/foo") { _, res -> res.write("Hello foo") }
  path("/api") {
    get("/user") { _, res -> res.write("Hello user") }
  }
}.start()
```
