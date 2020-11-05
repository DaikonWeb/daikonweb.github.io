---
layout: default
title: Multipart Data
nav_order: 4
parent: Request
---

# Multipart Data

You can use `.multipart(key)` method from `request` to retrieve a multipart file or field from current request.

```kotlin
import topinambur.http

@Test
fun `receive a file`() {
  HttpServer()
    .post("/*") { req, res -> res.write(req.multipart("first").content) }
    .start().use {
      val response = "http://localhost:4545/".http.post(
        data = mapOf("first" to FilePart("file", "txt", "file_content".toByteArray()))
      )

      assertThat(response.body).isEqualTo("file_content")
    }
}
```

You can also receive both file and field.

```kotlin
import topinambur.http

@Test
fun `receive a file and a field`() {
  HttpServer()
    .post("/*") { req: Request, res ->
      res.write(req.multipart("file").content)
      res.write("|")
      res.write(req.multipart("field").content)
    }
    .start().use {
      val response = "http://localhost:4545/".http.post(data = mapOf(
        "file" to FilePart("file", "txt", "file_content".toByteArray()),
        "field" to FieldPart("field_value")
      ))

      assertThat(response.body).isEqualTo("file_content|field_value")
    }
}
```
