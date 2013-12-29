---
layout: sidebar
title: 'Resultados de búsqueda'
dynamic: true
---

if @req.query.sargs
    query = @req.query.sargs
    div class:"panel panel-info", ->
    	header class:"panel-heading", ->
    		text "Resultados relacionados con #{query}"
    	section class:"panel-body", ->
    		ul ->
		        for document in @getCollection('posts').findAll({title:$like:query}).toJSON()
		            li 'typeof': 'sioc:Page', about: document.url, class: ('active'  if @document.url is document.url), ->
		                a href: document.url, property: 'dc:title', ->
		                    text document.title

else
	div class:"panel panel-danger", ->
		header class:"panel-heading", ->
			text "Búsqueda cancelada."
		section class:"panel-body", ->
			text "Faltan argumentos de búsqueda."
