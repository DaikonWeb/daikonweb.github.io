---
layout: default
title: Routing
nav_order: 30
has_children: true
---

# Routing

The main building block of a Daikon application is a set of routes. A route is made up of three pieces:

* Method ```(get, post, ...)```
* Path ```(/foo, /foo/:bar, /foo/*)```
* Action ```(request, response) -> { }```