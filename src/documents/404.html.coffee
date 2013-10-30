---
layout: wrap-9-3
title: '404 Not Found'
dynamic: true
---

div class: "hero-unit", ->
  h1 "404 Not Found"
  p ->
    text "Ooops! It looks like the document you requested at "
    code @req.url 
    text "couldn't be found."
