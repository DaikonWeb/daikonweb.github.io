---
layout: default
title: Parameters
nav_order: 1
parent: Request
---

# Parameters

## Query-String
You can use `.param()` method from `request` object in a `GET` route-action to retrieve a query-string parameter.

```kotlin
@Test
fun `query string parameter`() {
    HttpServer()
        .get("/") { req, res -> res.write("hello ${req.param("name")}") }
        .start().use {
            assertThat(get("/?name=Bob").text).isEqualTo("hello Bob")
        }
}
```

## Body parameters
You can use `.param()` method from `request` object in a `POST` route-action to retrieve an url-encoded parameter.

```kotlin
@Test
fun `post data`() {
    HttpServer()
        .post("/") { req, res -> res.write("hello ${req.param("name")}") }
        .start()
        .use {
            assertThat(post("/", data = mapOf("name" to "Bob")).text).isEqualTo("hello Bob")
        }
}
```

## Body
You can use `.body()` method from `request` object to retrieve the raw body.

```kotlin
@Test
fun body() {
    HttpServer()
        .any("/") { req, res -> res.write("Hello ${req.body()}") }
        .start().use {
            assertThat(post("/", data = "Bob").text).isEqualTo("Hello Bob")
        }
}
```