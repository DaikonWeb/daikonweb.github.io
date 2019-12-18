---
layout: default
title: Daikon Freemarker
parent: Response Extensions
nav_order: 1
---

# Daikon Freemarker
Daikon Freemarker adds two methods to the Response:
* `render(name, model, folder)`: to render a Freemarker template
  * `name` is the file template name to render without `.ftl` extension
  * `model` is a map to inject objects inside the template. The default is an empty map
  * `folder` is the directory of your templates. The default is `src/main/resources/templates`

* `html(name, model, folder)`: is like `render` but also set the content type to `text/html;charset=utf-8`

# Repository
https://github.com/DaikonWeb/daikon-freemarker
