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

```
@Test
fun `write a response text`() {
    HttpServer()
        .get("/") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(get("/").text).isEqualTo("Hello")
        }
}
```

## HTTP Status Code
Use `.status(code: Int)` method to set the HTTP status code for the response.

```
@Test
fun `set an HTTP status code`() {
    HttpServer()
        .get("/") { _, res -> res.status(201) }
        .start().use {
            assertThat(get("/").statusCode).isEqualTo(201)
        }
}
```

## Content Type
Use `.type(contentType: String)` method to set the content-type header for the response.

```
@Test
fun `set a Content-Type`() {
    HttpServer()
        .get("/") { _, res -> res.type("application/json") }
        .start().use {
            assertThat(get("/").headers["Content-Type"]).isEqualTo("application/json")
        }
}
```

## Headers
Use `.header(name: String, value: String)` method to set an header for the response.

```
@Test
fun `set a header`() {
    HttpServer()
        .any("/") { _, res -> res.header("foo", "bar") }
        .start().use {
            assertThat(get("/").headers["foo"]).isEqualTo("bar")
        }
}
```