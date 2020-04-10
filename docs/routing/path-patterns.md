---
layout: default
title: Path patterns
parent: Routing
nav_order: 4
---

# Path patterns

Routes matches the most specific path: if you declare exactly the same path and method twice, the second wins!

You can specify a path in three ways:

## 1. Exact match
Matches exactly the specified path

```kotlin
import topinambur.http

@Test
fun `exact match`() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello foo") }
        .start().use {
            assertThat("http://localhost:4545/foo".http.get().body).isEqualTo("Hello foo")
        }
}
```

## 2. Approximate match
You can use `*` as wildcard

```kotlin
import topinambur.http

@Test
fun `approximate match`() {
    HttpServer()
        .get("/one/*") { _, res -> res.write("one") }
        .get("/two/*/foo") { _, res -> res.write("two") }
        .get("/three/*foo") { _, res -> res.write("three") }
        .start().use {
            assertThat("http://localhost:4545/one/foo".http.get().body).isEqualTo("one")
            assertThat("http://localhost:4545/two/baz/foo".http.get().body).isEqualTo("two")
            assertThat("http://localhost:4545/three/thefoo".http.get().body).isEqualTo("three")
        }
}
```

## 3. With path parameters

```kotlin
import topinambur.http

@Test
fun `path parameters`() {
    HttpServer()
        .get("/foo/:name/baz") { req, res -> res.write("Hello ${req.param(":name")}") }
        .start().use {
            assertThat("http://localhost:4545/foo/bar/baz".http.get().body).isEqualTo("Hello bar")
        }
}
```

# Group of paths
You can deduplicate common parts of the path with the `path` syntax. `path` can also be nested.

```kotlin
import topinambur.http

@Test
fun `nested paths`() {
    HttpServer()
        .path("/one") {
            get("/two1") { _, res -> res.write("two1") }
            path("/two2") {
                get("/three") { _, res -> res.write("three") }
            }
        }
        .start().use {
            assertThat("http://localhost:4545/one/two1".http.get().body).isEqualTo("two1")
            assertThat("http://localhost:4545/one/two2/three".http.get().body).isEqualTo("three")
        }
}
```
