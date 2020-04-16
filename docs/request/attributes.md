---
layout: default
title: Attributes
nav_order: 3
parent: Request
---

# Attributes

You can use `.attribute(key, value)` method from `request` to set an object on the request and then retrieve it with `.attribute(key)`.
A common use of attributes is to propagate objects between hooks and route action.

```kotlin
import topinambur.http

@Test
fun attribute() {
    HttpServer()
        .before("/") { req, _ -> req.attribute("foo_key", "foo_value") }
        .get("/") { req, res -> res.write(req.attribute("foo_key")) }
        .start().use {
            assertThat("http://localhost:4545/".http.get().body).isEqualTo("foo_value")
        }
}
```

You can check if an attribute is present before accessing it.
You can use `.hasAttribute("name")` request method.

```kotlin
import topinambur.http

@Test
fun `check if an attribute is present``() {
    HttpServer()
        .before("/") { req, _ -> req.attribute("foo_key", "foo_value") }
        .get("/") { req, res ->
            assertThat(req.hasAttribute("foo_key")).isTrue()
            assertThat(req.hasAttribute("bar_key")).isFalse()
        }
        .start().use {
            "http://localhost:4545/".http.get().body
        }
}
```
