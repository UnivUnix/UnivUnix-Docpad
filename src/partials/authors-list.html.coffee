for author in @authors
  a class: "btn btn-sm btn-default", href: "/authors/" + author.toLowerCase(), ->
    text author
