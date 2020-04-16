---
layout: default
title: Parameters
nav_order: 1
parent: Request
---

# Parameters

## Check if a parameter is present

You can check if a parameter is present before accessing it.
You can use `.hasParam("name")` request method.

Has parameter works for all types of parameters (query-string, body, path)

```kotlin
import topinambur.http

@Test
fun `check if a parameter is present`() {
    HttpServer()
        .post("/") { req, res ->
            assertThat(req.hasParam("name")).isTrue()
            assertThat(req.hasParam("age")).isFalse()
        }
        .start().use {
            "http://localhost:4545/?name=Bob".http.get()
        }
}
```

## Query-String parameters
You can use `.param()` method from `request` object to retrieve a query-string parameter.

```kotlin
import topinambur.http

@Test
fun `query string parameter`() {
    HttpServer()
        .get("/") { req, res -> res.write("hello ${req.param("name")}") }
        .start().use {
            assertThat("http://localhost:4545/".http.get(params = mapOf("name" to "Bob")).body).isEqualTo("hello Bob")
        }
}
```

## Body parameters
You can use `.param()` method from `request` object in a `POST` route-action to retrieve an `application/x-www-form-urlencoded` parameter.

```kotlin
import topinambur.http

@Test
fun `post data`() {
    HttpServer()
        .post("/") { req, res -> res.write("hello ${req.param("name")}") }
        .start()
        .use {
            assertThat("http://localhost:4545/".http.post(data = mapOf("name" to "Bob")).body).isEqualTo("hello Bob")
        }
}
```

## Path parameters
You can use `.param()` method from `request` object to retrieve a path parameter. You must use the same name you gave in the path including the colon.

```kotlin
import topinambur.http

@Test
fun `path parameter`() {
    HttpServer()
        .get("/user/:name") { req, res -> res.write("hello ${req.param(":name")}") }
        .start()
        .use {
            assertThat("http://localhost:4545/user/Bob".http.get().body).isEqualTo("hello Bob")
        }
}
```

## Body
You can use `.body()` method from `request` object to retrieve the raw body.

```kotlin
import topinambur.http

@Test
fun body() {
    HttpServer()
        .any("/") { req, res -> res.write("Hello ${req.body()}") }
        .start().use {
            assertThat("http://localhost:4545/".http.post(body = "Bob").body).isEqualTo("Hello Bob")
        }
}
```
