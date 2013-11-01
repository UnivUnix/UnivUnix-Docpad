---
layout: main
---

section id: "content", class: "container", ->
  div class: "row", ->
    div class: "col-lg-9", role: "main", ->
      div class: "container", ->
        text @content
    text @partial('sidebar.html.coffee', @)