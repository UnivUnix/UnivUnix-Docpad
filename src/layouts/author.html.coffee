---
layout: default
---

article id: @document.id, class: "author hentry", ->
  header ->
    h2 ->
      @document.title
  div class: "entry-content", ->
    text @content
  footer ->
    i class: "icon-calendar icon-white"
    time class: "updated", datetime: @postDatetime(@document.date), ->
      text @postDate(@document.date)
