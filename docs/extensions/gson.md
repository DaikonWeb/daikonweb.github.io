---
layout: default
title: Daikon Gson
parent: Extensions
nav_order: 2
---

# Daikon Gson

## Methods
Daikon Gson adds one method to the **Response** and one to the **Request**.

### Response
`.json(myInstance)`: to render a class instance as a Json string

### Request
`.json<MyClass>()`: to transform a json string to the desired class instance

## How to use
1. Define a data class
```
data class Greeting(val say: String, val language: String)
```

2. Create a server and use the data class to read and produce Json
```
HttpServer()
    .post("/hello") { req, res -> res.json(req.json<Greeting>()) }
    .start().use {
        val response = post(url = "http://localhost:4545/hello", json = mapOf("say" to "Ciao", "language" to "ITA"))
        assertThat(response.text).isEqualTo("""{"say":"ciao","language":"ITA"}""")
        assertThat(response.headers["Content-Type"]).isEqualTo(APPLICATION_JSON_UTF_8.asString())
    }
```

## Repository
[https://github.com/DaikonWeb/daikon-gson](https://github.com/DaikonWeb/daikon-gson)
