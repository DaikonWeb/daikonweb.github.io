---
layout: default
title: Daikon Lambda
parent: Extensions
nav_order: 6
---

# Daikon Lambda
Daikon Lambda is a sibling library to Daikon it simpifies the build of a Kotlin-serverless application on AWS Lambda.

## Project
[https://github.com/DaikonWeb/daikon-lambda](https://github.com/DaikonWeb/daikon-lambda)

## How to use

### Extends the HttpHandler in your Serverless project
```
class VegetablesHandler : HttpHandler() {
    override fun LambdaCall.routing() {
        get("/") { req, res -> res.write("Hello, I'm a daikon-lambda!") }
    }
}
```
