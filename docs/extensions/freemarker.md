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
  * `name` is the file template name to render without `.ftl` extension
  * `model` is a map to inject objects inside the template. The default is an empty map
  * `folder` is the directory of your templates. The default is `src/main/resources/templates`

* `html(name, model, folder)`: is like `render` but also set the content type to `text/html;charset=utf-8`

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

Template `hello_to.ftl` content:
```
hello ${name}
```

## Repository
[https://github.com/DaikonWeb/daikon-freemarker](https://github.com/DaikonWeb/daikon-freemarker)
