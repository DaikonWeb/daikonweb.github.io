---
layout: default
title: Error handling
parent: Routing
nav_order: 7
---

# Error handling
When a route action throw an exception the server returns an internal server error (status code 500)

```kotlin
@Test
fun `error handling`() {
    HttpServer {
        get("/foo") { _, _ -> throw RuntimeException() }
        get("/bar") { _, res -> res.write("Hello")}
    }.start().use {
        assertThat(get("/foo").statusCode).isEqualTo(INTERNAL_SERVER_ERROR_500)
        assertThat(get("/bar").text).isEqualTo("Hello")
    }
}
```