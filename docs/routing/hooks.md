---
layout: default
title: Hooks
parent: Routing
nav_order: 6
---

# Hooks
You can specify hooks that will be executed before or after a specified path

## Hooks before action
```kotlin
@Test
fun `before action`() {
    HttpServer()
        .before("/*")  { _, res -> res.write("Hello") }
        .get("/foo") { _, res -> res.write(" Bob") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello Bob")
        }
}
```

## Hooks after action
```kotlin
@Test
fun `after action`() {
    HttpServer()
        .after("/foo")  { _, res -> res.write(" Bob") }
        .get("/foo") { _, res -> res.write("Bye") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Bye Bob")
        }
}
```

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