---
layout: default
title: Response
nav_order: 50
has_children: true
---

# Response
Response information and functionality is provided by the response parameter.

## Body
Use `.write(text: String)` method to write some text in the body response. Use `.body()` method to get the text already written to the response.

```kotlin
import topinambur.http

@Test
fun `write a response text`() {
    HttpServer()
        .get("/") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/".http.get().body).isEqualTo("Hello")
        }
}
```

## HTTP Status Code
Use `.status(code: Int)` method to set the HTTP status code for the response.

```kotlin
import topinambur.http

@Test
fun `set an HTTP status code`() {
    HttpServer()
        .get("/") { _, res -> res.status(CREATED_201) }
        .start().use {
            assertThat("http://localhost:4545/".http.get().statusCode).isEqualTo(CREATED_201)
        }
}
```

## Content Type
Use `.type(contentType: String)` method to set the content-type header for the response.

```kotlin
import topinambur.http

@Test
fun `set a Content-Type`() {
    HttpServer()
        .get("/") { _, res -> res.type("application/json") }
        .start().use {
            assertThat("http://localhost:4545/".http.get().header("Content-Type")).isEqualTo("application/json")
        }
}
```

## Headers
Use `.header(name: String, value: String)` method to set a header for the response.

```kotlin
import topinambur.http

@Test
fun `set a header`() {
    HttpServer()
        .any("/") { _, res -> res.header("foo", "bar") }
        .start().use {
            assertThat("http://localhost:4545/".http.get().header("foo")).isEqualTo("bar")
        }
}
```

## Log the response
You can access to the response body, status and type, so you can log the response in this way:

```kotlin
import topinambur.http

@Test
fun `log the response`() {
    HttpServer()
        .any("/") { _, res ->
            res.type("application/json")
            res.write("Hello")
        }
        .after("/") { _, res ->
            println("statusCode: ${res.status()}")
            println("contentType: ${res.type()}")
            println("body: ${res.body()}")
        }
        .start().use {
            assertThat("http://localhost:4545/".http.get().body).isEqualTo("Hello")
        }
}
```

