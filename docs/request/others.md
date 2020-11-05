---
layout: default
title: Others
nav_order: 5
parent: Request
---

# Others

## Url
You can use `.url()` method from `request` object to retrieve the called url.

```kotlin
import topinambur.http

@Test
fun `request url with querystring`() {
    HttpServer()
        .get("/test") { req, res -> res.write(req.url()) }
        .start().use {
            val request = "http://localhost:4545/test?name=Bob&surname=Marley".http.get()
            assertThat(request.body).isEqualTo("http://localhost:4545/test?name=Bob&surname=Marley")
        }
}
```

## Path
You can use `.path()` method from `request` object to retrieve the last part of the called url.

```kotlin
import topinambur.http

@Test
fun `request path`() {
    HttpServer()
        .get("/:foo") { req, res -> res.write(req.path()) }
        .start().use {
            assertThat("http://localhost:4545/123".http.get().body).isEqualTo("/123")
        }
}
```

## Method
You can use `.method()` method from `request` object to retrieve the used method when the url is called.

```kotlin
import topinambur.http

@Test
fun method() {
    HttpServer()
        .any("/") { req, res -> res.write("${req.method()}") }
        .start()
        .use {
            assertThat("http://localhost:4545/".http.post().body).isEqualTo("POST")
        }
}
```
