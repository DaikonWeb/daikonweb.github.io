---
layout: default
title: Daikon Lambda
parent: Extensions
nav_order: 6
---

# Daikon Lambda
Daikon Lambda is a sibling library to Daikon it simpifies the build of a Kotlin-serverless application on AWS Lambda.

## How to use

### Extends the HttpHandler in your Serverless project
```
class MyHandler : HttpHandler() {
    override fun routing() {
        get("/") { req, res -> res.write("Hello, I'm a daikon-lambda!") }
    }
}
```

## For more informations go to the Project README
[https://github.com/DaikonWeb/daikon-lambda](https://github.com/DaikonWeb/daikon-lambda)
