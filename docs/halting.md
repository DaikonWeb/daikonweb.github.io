---
layout: default
title: Halting
nav_order: 60
---

# Halting a request flow
If you want to suspend the execution of a request you can use `halt(response)`. You can specify it in a before hook, in a route action or in an after hook.

```kotlin
@Test
fun `halt request`() {
    HttpServer()
        .before { _, res -> halt(res, UNAUTHORIZED_401, "Go away") }
        .get("/") { _, res -> res.status(OK_200) }
        .start().use {
            val response = get("/")
            assertThat(response.statusCode).isEqualTo(UNAUTHORIZED_401)
            assertThat(response.text).isEqualTo("Go away")
        }
}
```