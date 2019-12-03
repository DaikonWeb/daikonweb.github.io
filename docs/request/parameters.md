---
layout: default
title: Parameters
nav_order: 1
parent: Request
---

# Parameters

## Query-String
You can use `.param()` method from `request` object to retrieve a query-string parameter.

```kotlin
@Test
  fun `query string parameter`() {
      HttpServer()
          .get("/") { req, res -> res.write("hello ${req.param("name")}") }
          .start().use {
              assertThat(get("/?name=Bob").text).isEqualTo("hello Bob")
          }
  }
```