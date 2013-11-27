---
layout: no-sidebar
title: 'Error 404'
dynamic: true
---

div class: "hero-unit", ->
  h1 "Error 404. Archivo no encontrado."
  p ->
    text "Parece que el documento que ha solicitado:"
    code @req.url 
    text "no ha podido ser encontrado."
