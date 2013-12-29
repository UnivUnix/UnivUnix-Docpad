---
layout: navbars
---

section id: "content", class: "container", ->
  div class: "row", ->
    div class: "col-lg-12", role: "main", ->
      div class: "container", ->
        div id: "cookieTool", class: "col-sm-12"
        text @content
      div class: "container", ->
        div class: "row", ->
          div class: "col-lg-12", ->
            if @document.isPaged
              ul class: "pager", ->
                if @hasPrevPage()
                  li class: "previous", ->
                    a class: "fadepage", href: @getPrevPage(), ->
                      text "Nuevos"
                else
                  li class: "previous disabled", ->
                    a ->
                      text "Nuevos"
                if @hasNextPage()
                  li class: "next", ->
                    a class: "fadepage", href: @getNextPage(), ->
                      text "Antiguos"
                else
                  li class: "next disabled", ->
                    a ->
                      text "Antiguos"