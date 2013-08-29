---
layout: default
---

article id: @document.id, class: "author hentry", ->
  div id: "img-profile", class: "col-12 col-sm-3 col-lg-3", ->
    if @document.imgprofile?
      img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@document.imgprofile, 'medium'), class: "lazy img-responsive img-rounded", alt: "User image"
      noscript ->
        img src: @getThumbnail(@document.imgprofile, 'medium'), class: "img-responsive img-rounded pull-left", alt: "User image"
    else
      img src: @getUrl("/img/placeholder.gif"), 'data-original': @getThumbnail(@getUrl("/img/userimg.jpg"), 'medium'), class: "lazy img-responsive img-rounded", alt: "User image"
      noscript ->
        img src: @getThumbnail(@getUrl("/img/userimg.jpg"), 'medium'), class: "img-responsive img-rounded pull-left", alt: "User image"
  div id: "content-profile", class: "col-12 col-sm-6 col-lg-6", ->
    text @contento  
