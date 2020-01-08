---
layout: default
title: Headers
nav_order: 2
parent: Request
---

# Headers

You can use `.header()` method from `request` object to retrieve a http header.

```kotlin
@Test
fun headers() {
    HttpServer()
        .post("/*") { req, res -> res.write("hello ${req.header("name")}") }
        .start()
        .use {
            assertThat(post("/", headers = mapOf("name" to "Bob")).text).isEqualTo("hello Bob")
        }
}
```
