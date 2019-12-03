---
layout: default
title: Methods
parent: Routing
nav_order: 3
---

# Routing methods

The main building block of a Daikon application is a set of routes. A route is made up of three pieces:

* Method ```(get, post, head, any)```
* Path ```(/foo, /foo/:bar, /foo/*)```
* Action ```(request, response) -> { }```

Routes matches the most specific one, if you declare exactly the same path and method twice, the second wins!

You can specify a path in three ways:
* exact ```/foo/bar```
* approximate ```/foo/*```
* with parameters ```/foo/:bar```

```kotlin
@Test
fun routing() {
    HttpServer()
        .get("/foo") { _, res -> res.write("Hello foo") }
        .get("/bar/*") { _, res -> res.write("Hello bar") }
        .get("/baz/:name") { req, res -> res.write("Hello ${req.param(":name")}") }
        .start().use {
            assertThat(get("/foo").text).isEqualTo("Hello foo")
            assertThat(get("/bar/too").text).isEqualTo("Hello bar")
            assertThat(get("/baz/bob").text).isEqualTo("Hello bob")
        }
}
```