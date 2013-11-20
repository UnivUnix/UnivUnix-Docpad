aside id: "sidebar", class: "col-lg-3", role: "complementary", ->
  section id: "pages", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Acerca de:"
      div class: "widget-content", ->
        ul ->
          for document in @uniqueArray(@getCollection('pages').toJSON())
            li class: ('active' if @document.url == document.url), ->
              a href: document.url, property: "dc:title", ->
                document.title
  section id: "ads", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Publicidad"
      div class: "widget-content", ->
        script async: yes, src: "//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
        # UnivUnix
        ins class: "adsbygoogle", style: "display:block;width:250px;height:250px;", 'data-ad-client':"ca-pub-9661747922699028", 'data-ad-slot':"1309145396"
        script ->
          text "(adsbygoogle = window.adsbygoogle || []).push({});"
  section id: "staff", class: "widget", ->
    div class: "container", ->
      div class: "widget-title", ->
        h3 ->
          text "Staff"
      div class: "widget-content", ->
        ul ->
          for author in @uniqueArray(@getCollection('authorPages').toJSON())
            li ->
              a href: "/authors/"+author.title.toLowerCase(), ->
                text author.title
