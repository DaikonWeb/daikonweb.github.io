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
@Test
fun `functional way`() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello")
        }
}
```

## 2. The object oriented way
```kotlin
@Test
fun `object oriented way`() {
    HttpServer()
        .get("/", MyRouteAction())
        .start().use {
            assertThat(get("/").text).isEqualTo("foo")
        }
}

class MyRouteAction : RouteAction {
    override fun handle(request: Request, response: Response) {
        response.write("foo")
    }
}
```