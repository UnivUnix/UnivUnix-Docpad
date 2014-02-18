---
layout: sidebar
title: 'Relacionados'
dynamic: true
---

if @req.query.sargs
    query = @req.query.sargs
    div class:"panel panel-info", ->
    	header class:"panel-heading", ->
    		text "Resultados relacionados con la etiqueta #{query}"
    	section class:"panel-body", ->
    		ul ->
		        for document in @getCollection('posts').findAll({tags:$has:query}).toJSON()
		            li 'typeof': 'sioc:Page', about: document.url, ->
		                a href: document.url, property: 'dc:title', ->
		                    text document.title

else
	div class:"panel panel-danger", ->
		header class:"panel-heading", ->
			text "Proceso cancelado."
		section class:"panel-body", ->
			text "Falta argumento de etiqueta."