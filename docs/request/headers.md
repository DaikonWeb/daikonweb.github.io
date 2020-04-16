---
layout: default
title: Headers
nav_order: 2
parent: Request
---

# Headers

You can use `.header()` method from `request` object to retrieve a http header.

```kotlin
import topinambur.http

@Test
fun headers() {
    HttpServer()
        .post("/*") { req, res -> res.write("hello ${req.header("name")}") }
        .start()
        .use {
            assertThat("http://localhost:4545/".http.post(headers = mapOf("name" to "Bob")).body).isEqualTo("hello Bob")
        }
}
```

You can check if an header is present before accessing it.
You can use `.hasHeader("name")` request method.

```kotlin
import topinambur.http

@Test
fun `check if an header is present`() {
    HttpServer()
        .post("/") { req, res ->
            assertThat(req.hasHeader("name")).isTrue()
            assertThat(req.hasHeader("age")).isFalse()
        }
        .start().use {
            "http://localhost:4545/".http.post(headers = mapOf("name" to "Bob"))
        }
}
```
