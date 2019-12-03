---
layout: default
title: Quick Start
nav_order: 1
---

# Quick Start

## 1. Add Daikon to your project

### Gradle

Add JitPack in your root build.gradle at the end of repositories:

```groovy
repositories {
    ...
    maven { url 'https://jitpack.io' }
}
```

Add the dependency

```groovy
implementation 'com.github.DaikonWeb:daikon:0.5.2'
```

### Maven

Add the JitPack repository to your build file
```xml
<repositories>
    <repository>
        <id>jitpack.io</id>
        <url>https://jitpack.io</url>
    </repository>
</repositories>
```

Add the dependency

```xml
<dependency>
    <groupId>com.github.DaikonWeb</groupId>
    <artifactId>daikon</artifactId>
    <version>0.5.2</version>
</dependency>
```

## 2. Copy this to your main file:

```kotlin
import daikon.HttpServer

fun main() {
  HttpServer().start()
}
```

## 3. Open your browser
Go to `http://localhost:4545` and see what happens