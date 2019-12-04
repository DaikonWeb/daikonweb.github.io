---
layout: default
title: End to end tests
nav_order: 1
parent: Testing
---

# How to test write an end to end test

You can start the server in the test, call routes and make assertions, then you can stop the server.
Methods `get`, is provided by [OkHttp](https://square.github.io/okhttp/).

```kotlin
@Test
fun `say hello`() {
    HttpServer()
        .get("/*") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(get("http://localhost:4545/").text).isEqualTo("Hello")
        }
}
```