---
layout: main
---

section id: "content", class: "container", ->
  div class: "row", ->
    div class: "col-lg-9", role: "main", ->
      div class: "container", ->
        text @content
      if @document.isPaged?
        if @hasPrevPage || @hasNextPage()
          nav id: "post-nav", ->
            ul class: "pager", ->
              unless @hasPrevPage()
                li class: "disabled previous", ->
                  a ->
                    text "< Anteriores"
              else
                li class: "previous", ->
                  a href: @getPrevPage(), ->
                    text "< Anteriores"
              unless @hasNextPage()
                li class: "disabled next", ->
                  a ->
                    text "Nuevas >"
              else
                li class: "next", ->
                  a href: @getNextPage(), ->
                    text "Nuevas >"
    text @partial('sidebar.html.coffee', @)