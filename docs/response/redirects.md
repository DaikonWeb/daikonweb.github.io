---
layout: default
title: Redirects
nav_order: 2
parent: Response
---

# Redirects

You can use `redirect` to redirect the browser to a relative or absolute path.
The defaul redirection is temporary (status code 302) but you can also use a specific HTTP 3xx status code.

```kotlin
import topinambur.http

@Test
fun `redirect to relative path`() {
    HttpServer()
        .any("/foo") { _, res -> res.redirect("/bar", MOVED_PERMANENTLY_301) }
        .any("/bar") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/foo".http.get(followRedirects = true).body).isEqualTo("Hello")
        }
}
```
