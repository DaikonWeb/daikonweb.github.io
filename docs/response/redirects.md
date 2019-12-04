---
layout: default
title: Redirects
nav_order: 2
parent: Response
---

# Redirects

You can use `redirect` to redirect the browser to a relative or absolute path. 
The defaul redirection is temporarily (status code 302) but you can use a specific Http 3xx status code.

```kotlin
@Test
fun `redirect to relative path`() {
    HttpServer()
        .any("/foo") { _, res -> res.redirect("/bar", MOVED_PERMANENTLY_301) }
        .any("/bar") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello")
        }
}
```