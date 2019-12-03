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
