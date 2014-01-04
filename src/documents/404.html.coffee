---
layout: nosdbar
title: 'Error 404'
dynamic: true
---

div class: "panel panel-danger", ->
  header class:"panel-heading", ->
    text "Error 404. Archivo no encontrado."
  section class:"panel-body", ->
    text "Parece que el documento que ha solicitado: "
    code @req.url
    text " no ha podido ser encontrado."
