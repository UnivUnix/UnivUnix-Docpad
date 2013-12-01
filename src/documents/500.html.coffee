---
layout: no-sidebar
title: 'Error 500'
dynamic: true
---

div class: "hero-unit", ->
  h1 "Error 500. Fallo interno del servidor."
  p ->
    text "Algo falló en el servidor mientras solicitaba este documento: "
    code @req.url
    text "Aquí se encuentra el error detallado:"
  p ->
  	if @err isnt undefined
      pre @err.message or @err.stack
