---
layout: default
title: Route action
nav_order: 1
parent: Testing
---

# How to test a route action

You can write a unit test of the route action.
Methods `mock`, `whenever` and `verify` are provided by [mockito-kotlin](https://github.com/nhaarman/mockito-kotlin)

```kotlin
private val request: Request = mock()
private val response: Response = mock()

@Test
fun `eating a daikon`() {
    whenever(request.param("food")).thenReturn("daikon")

    EatingRouteAction().handle(request, response)

    verify(response).write("You are eating a daikon")
}

class EatingRouteAction : RouteAction {
    override fun handle(request: Request, response: Response) {
        response.write("You are eating a ${request.param("food")}")
    }
}
```