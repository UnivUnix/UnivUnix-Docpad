---
layout: no-sidebar
title: 'Error 500'
dynamic: true
---

div class: "panel panel-danger", ->
  header class:"panel-heading", ->
    text "Error 500. Fallo interno del servidor."
  section class:"panel-body", ->
    text "Algo falló en el servidor mientras solicitaba este documento: "
    code @req.url
    text " ."
