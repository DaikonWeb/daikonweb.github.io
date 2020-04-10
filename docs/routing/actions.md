---
layout: default
title: Actions
parent: Routing
nav_order: 5
---

# Actions
You can specify the action in two ways

## 1. The functional way
```kotlin
import topinambur.http

@Test
fun `functional way`() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat("http://localhost:4545/foo".http.get().body).isEqualTo("Hello")
        }
}
```

## 2. The object oriented way
```kotlin
import topinambur.http

@Test
fun `object oriented way`() {
    HttpServer()
        .get("/", MyRouteAction())
        .start().use {
            assertThat("http://localhost:4545/".http.get().body).isEqualTo("foo")
        }
}

class MyRouteAction : RouteAction {
    override fun handle(request: Request, response: Response, context: Context) {
        response.write("foo")
    }
}
```