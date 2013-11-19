---
layout: main
---

section id: "content", class: "container", ->
  div class: "row", ->
    div class: "col-lg-9", role: "main", ->
      div class: "container", ->
        text @content
      if @document.isPaged?
        if @hasPrevPage or @hasNextPage()
          nav id: "post-nav", ->
            ul class: "pager", ->
              unless @hasPrevPage()
                li class: "disabled previous", ->
                  a ->
                    text "< Nuevas"
              else
                li class: "previous", ->
                  a href: @getPrevPage(), ->
                    text "< Nuevas"
              unless @hasNextPage()
                li class: "disabled next", ->
                  a ->
                    text "Anteriores >"
              else
                li class: "next", ->
                  a href: @getNextPage(), ->
                    text "Anteriores >"
    if @document.isAuthorPage?
      unless @document.isAuthorPage
        text @partial('sidebar.html.coffee', @)
      else
        text @partial('sidebar-author.html.coffee', @)
    else text @partial('sidebar.html.coffee, @')