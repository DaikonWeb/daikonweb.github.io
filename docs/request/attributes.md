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
@Test
fun attribute() {
    HttpServer()
        .before("/") { req, _ -> req.attribute("foo_key", "foo_value") }
        .get("/") { req, res -> res.write(req.attribute("foo_key")) }
        .start().use {
            assertThat(get("/").text).isEqualTo("foo_value")
        }
}
```
