---
layout: wrap-9-3
---

article id: @document.id, class: "page hentry", ->
  header ->
    h2 ->
      @document.title
  div class: "entry-content", ->
    text @content
  footer ->
    button type:"button", class:"btn btn-sm btn-default", ->
      i class: "glyphicon glyphicon-calendar"
      time class: "updated", datetime: @postDate(@document.date, "html"), ->
        text @postDate(@document.date, "ue")
