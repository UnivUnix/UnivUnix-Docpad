getCssClass = (categories) ->
  return "tutorials"  if $.inArray("Tutoriales", categories) > -1
  return "news"  if $.inArray("Noticias", categories) > -1
  return "programming"  if $.inArray("Programación", categories) > -1
  categories[0].toLowerCase()
      
  
  
    
    
