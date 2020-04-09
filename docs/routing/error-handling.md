---
layout: default
title: Error handling
parent: Routing
nav_order: 7
---

# Default error handling
When a route action throws an exception, the server prints an html page with the error's stack-trace with an internal server error 500 status code.

```kotlin
@Test
fun `default error handling`() {
    HttpServer {
        get("/foo") { _, _ -> throw RuntimeException() }
        get("/bar") { _, res -> res.write("Hello")}
    }.start().use {
        assertThat(local("/foo").http.get().statusCode).isEqualTo(INTERNAL_SERVER_ERROR_500)
        assertThat(local("/foo").http.get().body).contains("<h3>Caused by:</h3><pre>java.lang.RuntimeException")
    }
}
```

# Override default error handling
In the example below when you make a request to `/foo` the servers prints the stackTrace to the standard error, and responds with a 500 status code with an empty body.

```kotlin
@Test
fun `overrides default error handling`() {
    HttpServer {
        exception(RuntimeException::class.java) { req, res, exception ->
            exception.printStackTrace()
            res.status(INTERNAL_SERVER_ERROR_500)
        }
        get("/foo") { _, _ -> throw RuntimeException() }
        get("/bar") { _, res -> res.write("Hello")}
    }.start().use {
        assertThat(local("/foo").http.get().statusCode).isEqualTo(INTERNAL_SERVER_ERROR_500)
        assertThat(local("/foo").http.get().body).isEqualTo("")
    }
}
```