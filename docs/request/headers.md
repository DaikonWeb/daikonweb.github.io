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

You can check if an header is present before accessing it.
You can use `.hasHeader("name")` request method.

```kotlin
@Test
fun `check if an header is present`() {
    HttpServer()
        .post("/") { req, res ->
            val name = if (req.hasHeader("name")) req.header("name") else "World"
            res.write("Hello $name")
        }
        .start()
        .use {
            assertThat(post("/").text).isEqualTo("Hello World")
            assertThat(post("/", mapOf("name" to "Bob")).text).isEqualTo("Hello Bob")
        }
}
```
