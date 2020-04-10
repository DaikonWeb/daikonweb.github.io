---
layout: default
title: Daikon Freemarker
parent: Extensions
nav_order: 1
---

# Daikon Freemarker

## Project
[https://github.com/DaikonWeb/daikon-freemarker](https://github.com/DaikonWeb/daikon-freemarker)

## Methods
Daikon Freemarker adds two methods to the **Response**:
* `render(name, model, folder)`: to render a Freemarker template
  * `name` is the name of the template file to render, excluding the extension `.ftl`
  * `model` is a map to inject objects inside the template. The default is an empty map
  * `folder` is the directory of your templates. The default is `src/main/resources/templates`

* `html(name, model, folder)`: same as `render`, but it also sets the content type to `text/html;charset=utf-8`

## How to use
```kotlin
import topinambur.http

@Test
fun `render HTML`() {
    HttpServer()
        .get("/") { _, res -> res.html("hello_to", hashMapOf("name" to "Bob")) }
        .start().use {
            val response = "http://localhost:4545/".http.get()
            assertThat(response.header("Content-Type")).isEqualTo("text/html;charset=utf-8")
            assertThat(response.body).isEqualTo("hello Bob")
        }
}
```

Put your template file `hello_to.ftl` under the default directory `src/main/resources/templates`.

Content of the `hello_to.ftl` template:
```
hello ${name}
```
