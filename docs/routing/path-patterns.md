---
layout: default
title: Path patterns
parent: Routing
nav_order: 4
---

# Path patterns

Routes matches the most specific path, if you declare exactly the same path and method twice, the second wins!

You can specify a path in three ways:

## 1. Exact match
Matches exactly the specified path

```kotlin
@Test
fun routing() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello foo") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello foo")
        }
}
```

## 2. Approximate match
You can use `*` as wildcard

```kotlin
@Test
fun routing() {
    HttpServer()
        .get("/one/*") { _, res -> res.write("one") }
        .get("/two/*/foo") { _, res -> res.write("two") }
        .get("/three/*foo") { _, res -> res.write("three") }
        .start().use {
            assertThat(get("/one/foo").text).isEqualTo("one")
            assertThat(get("/two/baz/foo").text).isEqualTo("two")
            assertThat(get("/three/thefoo").text).isEqualTo("three")
        }
}
```

## 3. With path parameters

```kotlin
@Test
fun routing() {
    HttpServer()
        .get("/foo/:name/baz") { req, res -> res.write("Hello ${req.param(":name")}") }
        .start().use {
            assertThat(get("/foo/bar/baz").text).isEqualTo("Hello bar")
        }
}
```