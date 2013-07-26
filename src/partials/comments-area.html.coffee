commentsLength = @getComments().length
if commentsLength is 0
  div class: "alert", ->
    p ->
      "No hay comentarios aún. ¡Sé el primero!"
else
  section id:"comments", ->
    h3 ->
      "Comentarios:"
    ul class:"commentlist", ->
      for comment in @getComments().toJSON()
        li ->
          p ->
            comment.contentRenderedWithoutLayouts
section id:"response", ->
  header ->
    h3 ->
      "Deja tu comentario:"
  div class: "entry-response", ->
    div class: "alert alert-info", ->
      p ->
        "Todos los campos marcados con '*' son obligatorios."
      p ->
        "La dirección email no será mostrada al público."
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
    
    
