section id:"comments", ->
  commentsLength = @getComments().length
  if commentsLength > 0
    h3 ->
      "Comentarios:"
    ul class:"commentlist", ->
      for comment in @getComments().toJSON()
        li ->
          p ->
            comment.contentRenderedWithoutLayouts
section id:"response", ->
  h3 ->
    "Deja tu comentario:"
  form id:"commentform", method:"POST", action:"/comment", ->
    label 'for':"author", ->
      "Nombre: *"
    input id:"author", class:"text", type:"text", 'aria-required':"true", tabindex:"1", size:"22", value:"", name:"author"
    label 'for':"email", ->
      "Email: *"
    input id:"email", class:"text", type:"text", 'aria-required':"true", tabIndex:"2", size:"22", value:"", name:"email"
    label 'for':"url", ->
      "Web:"
    input id:"url", class:"text", type:"text", tabIndex:"3", size:"22", value:"", name:"url"
    
