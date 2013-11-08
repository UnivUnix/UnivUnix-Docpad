i class: "glyphicon glyphicon-user"
for author in @authors
  a class: "author", href: "/authors/" + author.toLowerCase(), ->
    text author
