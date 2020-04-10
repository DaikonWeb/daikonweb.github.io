---
layout: default
title: End to end tests
nav_order: 2
parent: Testing
---

# How to test write an end to end test

You can start the server in the test, call routes and make assertions, then you can stop the server.
Extension method `http` is provided by [Topinambur](https://github.com/DaikonWeb/topinambur).

```kotlin
import topinambur.http

@Test
fun `say hello`() {
    HttpServer()
        .get("/*") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/".http.get().body).isEqualTo("Hello")
        }
}
```
