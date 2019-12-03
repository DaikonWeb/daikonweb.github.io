---
layout: default
title: Methods
parent: Routing
nav_order: 3
---

# Methods
Currently supported methods:


## GET
```kotlin
@Test
fun get_request() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello")
        }
}
```

## POST
```kotlin
@Test
fun get_request() {
    HttpServer()
        .post("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(post("/foo").text).isEqualTo("Hello")
        }
}
```

## HEAD
```kotlin
@Test
fun get_request() {
   HttpServer()
        .head("/foo") { _, res -> res.status(ACCEPTED_202) }
        .start().use {
            assertThat(head("/foo").statusCode).isEqualTo(ACCEPTED_202)
        }
}
```