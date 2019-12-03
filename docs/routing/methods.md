---
layout: default
title: Methods
parent: Routing
nav_order: 3
---

# Methods
Currently supported methods:

## ANY
You can use `any` if you don't care about the request method

```kotlin
@Test
fun get() {
    HttpServer()
        .any("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello")
            assertThat(post("/foo").text).isEqualTo("Hello")
        }
}
```

## GET
```kotlin
@Test
fun get() {
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
fun post() {
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
fun head() {
   HttpServer()
        .head("/foo") { _, res -> res.status(ACCEPTED_202) }
        .start().use {
            assertThat(head("/foo").statusCode).isEqualTo(ACCEPTED_202)
        }
}
```