---
layout: default
---

article id: @document.id, class: "post hentry", ->
  header ->
    h2 ->
      @document.title
  div class: "entry-content", ->
    text @content
  footer ->
    div class: "alignleft", ->
      i class: "icon-calendar icon-white"
      time class: "updated", datetime: @postDatetime(@document.date), ->
        text @postDate(@document.date)
      i class: "icon-folder-open icon-white"
      text @getCategoryPages(@document.categories)
      i class: "icon-comment icon-white"
    div class: "dropdown all-camera-dropdown alignleft", ->
      i class: "icon-plus-sign icon-white"
      a class: "dropdown-toggle", 'data-toggle': "dropdown", href:"#share", ->
        text "Compartir"
      div class: "dropdown-menu", style: "padding:10px", ->
        a class: "twitter", href: "http://twitter.com/share?url=" + @document.url + "&amp;text=" + @document.title + "-&amp;via=UnivUnix", target: "_blank", title: "Compártelo en Twitter"
        a class: "facebook", href: "http://www.facebook.com/sharer.php?u=" + @document.url + "&amp;t=" + @document.title, target: "_blank", title: "Recomiéndalo en Facebook"
        a class: "gplus", href: "https://plus.google.com/share?url=" + @document.url, target: "_blank", title: "Compártelo en Google Plus"
        a class: "linkedin", href: "http://www.linkedin.com/shareArticle?mini=true&amp;url=" + @document.url + "&amp;title=" + @document.title, target: "_blank", title: "Divulga el artículo en LinkedIn"