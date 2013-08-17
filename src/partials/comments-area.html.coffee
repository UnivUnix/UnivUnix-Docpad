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
      input type:"hidden", name:"for", value:@document.relativeBase
      input type:"hidden", name:"userAgent", value:"User Agent"
      p class:"comment-author", ->
        label 'for':"author", ->
          "Nombre: *"
        input id:"author", class:"text", type:"text", 'aria-required':"true", tabindex:"1", size:"22", value:"", name:"author"
      p class:"comment-email", ->
        label 'for':"email", ->
          "Email: *"
        input id:"email", class:"text", type:"text", 'aria-required':"true", tabIndex:"2", size:"22", value:"", name:"email"
      p class:"comment-web", ->
        label 'for':"url", ->
          "Web:"
        input id:"url", class:"text", type:"text", tabIndex:"3", size:"22", value:"", name:"url"
      p class:"comment-content", ->
        textarea id:"comment", class:"input-xlarge", tabIndex:"4", name:"comment"
      p class:"comment-submit", ->
        input id:"submit", class:"btn btn-primary", type:"submit", value:"Enviar", tabIndex:"5", name:"submit"
    
