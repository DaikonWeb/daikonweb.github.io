---
layout: default
title: Daikon Freemarker
parent: Extensions
nav_order: 1
---

# Daikon Freemarker

## Methods
Daikon Freemarker adds two methods to the **Response**:
* `render(name, model, folder)`: to render a Freemarker template
  * `name` is the name of the template file to render, excluding the extension `.ftl`
  * `model` is a map to inject objects inside the template. The default is an empty map
  * `folder` is the directory of your templates. The default is `src/main/resources/templates`

* `html(name, model, folder)`: same as `render`, but it also sets the content type to `text/html;charset=utf-8`

## How to use
```
HttpServer()
    .get("/") { _, res -> res.html("hello_to", hashMapOf("name" to "Bob")) }
    .start().use {
        val response = get("http://localhost:4545/")
        assertThat(response.headers["Content-Type"]).isEqualTo(TEXT_HTML_UTF_8.asString())
        assertThat(response.text).isEqualTo("hello Bob")
    }
```

Put your template file `hello_to.ftl` under the default directory `src/main/resources/templates`.

Content of the `hello_to.ftl` template:
```
hello ${name}
```

## Repository
[https://github.com/DaikonWeb/daikon-freemarker](https://github.com/DaikonWeb/daikon-freemarker)
