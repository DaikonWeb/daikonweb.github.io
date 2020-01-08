---
layout: default
title: Static files
nav_order: 70
---

# Serve static files
You can serve static files with some limitations:
* you can't serve on the root path
* all static files must be under `/src/main/resources/assets` folder
* path and folder must have the same structure

For example, you can serve the file `/src/main/resources/assets/foo/style.css` with the url `http://localhost:4545/foo/style.css`.

```kotlin
@Test
fun `serve static files`() {
    HttpServer()
        .assets("/foo/*")
        .start().use {
            assertThat(get("/foo/style.css").statusCode).isEqualTo(OK_200)
        }
}
```
