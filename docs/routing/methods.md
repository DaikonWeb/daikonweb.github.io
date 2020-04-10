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
import topinambur.http

@Test
fun any() {
    HttpServer()
        .any("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/foo".http.get().body).isEqualTo("Hello")
            assertThat("http://localhost:4545/foo".http.post().body).isEqualTo("Hello")
        }
}
```

## GET
```kotlin
import topinambur.http

@Test
fun get() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/foo".http.get().body).isEqualTo("Hello")
        }
}
```

## POST
```kotlin
import topinambur.http

@Test
fun post() {
    HttpServer()
        .post("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/foo".http.post().body).isEqualTo("Hello")
        }
}
```

## HEAD
```kotlin
import topinambur.http

@Test
fun head() {
    HttpServer()
        .head("/foo") { _, res -> res.status(ACCEPTED_202) }
        .start().use {
            assertThat("http://localhost:4545/foo".http.head().statusCode).isEqualTo(ACCEPTED_202)
        }
}
```

## PUT
```kotlin
import topinambur.http

@Test
fun put() {
    HttpServer()
        .put("/") { _, res -> res.status(NO_CONTENT_204) }
        .start().use {
            assertThat("http://localhost:4545/".http.put().statusCode).isEqualTo(NO_CONTENT_204)
        }
}
```

## DELETE
```kotlin
import topinambur.http

@Test
fun delete() {
    HttpServer()
        .delete("/") { _, res -> res.status(NO_CONTENT_204) }
        .start().use {
            assertThat("http://localhost:4545/".http.delete().statusCode).isEqualTo(NO_CONTENT_204)
        }
}
```

## OPTIONS
```kotlin
import topinambur.http

@Test
fun options() {
    HttpServer()
        .options("/") { _, res -> res.status(OK_200) }
        .start().use {
            assertThat("http://localhost:4545/".http.options().statusCode).isEqualTo(OK_200)
        }
}
```