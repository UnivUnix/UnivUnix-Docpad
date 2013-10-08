# Import
moment = require('moment')

# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

  # =================================
  # Template Data
  # These are variables that will be accessible via our templates
  # To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

  templateData:

    # Specify some site properties
    site:
      # The production url of our website
      url: "http://www.univunix.com"

      # The default title of our website
      title: "UnivUnix"
      titleComplement: "El portal unificado de Unix y Linux."

      # The website description (for SEO)
      description: """
        Una web donde te pondremos al día en la información que rodea a Linux y programación: noticias, tutoriales y software variado e interesante.
        """

      # The website author's email
      email: ""

      # Styles
      styles: [
        "/styles/bootstrap.css"
      ]

      # Scripts
      scripts: [
        "/scripts/jquery-min.js",
        "/scripts/lazyload-min.js",
        "/vendor/twitter-bootstrap/js/transition.js",
        "/vendor/twitter-bootstrap/js/dropdown.js",
        "/vendor/twitter-bootstrap/js/collapse.js",
        "/vendor/twitter-bootstrap/js/affix.js",
        "/scripts/app.js"
      ]
      
      services:
        disqus: "univunix"


    # -----------------------------
    # Helper Functions

    # Get the prepared site/document title
    # Often we would like to specify particular formatting to our page's title
    # we can apply that formatting here
    getPreparedTitle: ->
      # if we have a document title, then we should use that and suffix the site's title onto it
      if @document.title
        "#{@document.title} | #{@site.title}"
      # if our document does not have it's own title, then we should just use the site's title
      else
        "#{@site.title} | #{@site.titleComplement}"

    # Get the prepared site/document description
    getPreparedDescription: ->
      # if we have a document description, then we should use that, otherwise use the site's description
      @document.description or @site.description

    # Get the prepared site/document keywords
    getPreparedKeywords: ->
      # Merge the document keywords with the site keywords
      @site.keywords.concat(@document.keywords or []).join(', ')

    getUrl: (document) ->
      # return @site.url + (@getPath(document))
      return document
    
    getAuthorsPages: (authors) ->
      authorsHtml = ""
      for author in authors
        authorsHtml += '<a class="btn btn-sm btn-default" href="/authors/' + author.toLowerCase() + '">' + author + '</a>'
      return authorsHtml

    getCategoryPages: (categories) ->
      catsHtml = ""
      for category in @getCollection('indexes').toJSON()
        for cat in categories
          if category.title?
            if category.title.toLowerCase() == cat
              catsHtml += '<a class="btn btn-sm btn-default" href="' + category.url + '">' + category.title + '</a>'
      return catsHtml
    
    getCategoryCss: (categories) ->
      cssCat = ""
      for category in @getCollection('indexes').toJSON()
        for cat in categories
          if category.title?
            if category.title.toLowerCase() == cat
              cssCat = cat + "-icon"
      return cssCat

    isDocCategory: (categories, indexTitle) ->
      result = false
      if categories?
        for cat in categories
          if indexTitle?
            if indexTitle.toLowerCase() == cat
              result = true
      return result

    getContentExtract: (content) ->
      i=content.search("</p>")
      content[0..i+3]

    # Post meta
    postDatetime: (date, format="YYYY-MM-DD") ->
      return moment(date).format(format)
    postDate: (date, format="DD/MM/YYYY") ->
      return moment(date).format(format)
    postDateRFC: (date, format="ddd, DD MMM YYYY HH:mm:ss ZZ") ->
      return moment(date).format(format)

    formatURL: (url) ->
      return url.replace(/\s/g, "%20")

  # =================================
  # Collections
  # These are special collections that our website makes available to us
  
  collections:
    
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

    indexes: (database) ->
      database.findAllLive({index: true}, [indexOrder:1, title:1])

    authors: (database) ->
      database.findAllLive({authorOrder: $exists: true}, [authorOrder:1,title:1])

    posts: (database) ->
      database.findAllLive({categories: $exists: true}, [date:-1])

    linux: (database) ->
      database.findAllLive({categories:$has:'linux'}, [date:-1])
      
    arch: (database) ->
      database.findAllLive({categories:$has:'arch'}, [date:-1])

    debian: (database) ->
      database.findAllLive({categories:$has:'debian'}, [date:-1])

    fedora: (database) ->
      database.findAllLive({categories:$has:'fedora'}, [date:-1])

    mageia: (database) ->
      database.findAllLive({categories:$has:'mageia'}, [date:-1])

    mint: (database) ->
      database.findAllLive({categories:$has:'mint'}, [date:-1])

    opensuse: (database) ->
      database.findAllLive({categories:$has:'opensuse'}, [date:-1])

    ubuntu: (database) ->
      database.findAllLive({categories:$has:'ubuntu'}, [date:-1])

    programacion: (database) ->
      database.findAllLive({categories:$has:'programacion'}, [date:-1])

    tutoriales: (database) ->
      database.findAllLive({categories:$has:'tutoriales'}, [date:-1])

    noticias: (database) ->
      database.findAllLive({categories:$has:'noticias'}, [date:-1])

  # =================================
  # Plugins

  plugins:
    downloader:
      downloads: [
        {
          name: 'Twitter Bootstrap'
          path: 'src/files/vendor/twitter-bootstrap'
          url: 'https://nodeload.github.com/twitter/bootstrap/tar.gz/master'
          tarExtractClean: true
        }
      ]

  # =================================
  # DocPad Events

  # Here we can define handlers for events that DocPad fires
  # You can find a full listing of events on the DocPad Wiki
  events:

    # Server Extend
    # Used to add our own custom routes to the server before the docpad routes are added
    serverExtend: (opts) ->
      # Extract the server from the options
      {server} = opts
      docpad = @docpad

      # As we are now running in an event,
      # ensure we are using the latest copy of the docpad configuraiton
      # and fetch our urls from it
      latestConfig = docpad.getConfig()
      oldUrls = latestConfig.templateData.site.oldUrls or []
      newUrl = latestConfig.templateData.site.url

      # Redirect any requests accessing one of our sites oldUrls to the new site url
      server.use (req,res,next) ->
        if req.headers.host in oldUrls
          res.redirect(newUrl+req.url, 301)
        else
          next()
          
  enviroments:
    development:
      templateData:
        site:
          url: 'http://localhost:9778'

  plugins:
    thumbnails:
      presets:
        'thumbnail':
          w: 700
          h: 440
        'small':
          w: 250
          h: 250
        'medium':
          w: 350
          h: 350
        'large':
          w: 500
          h: 500
}


# Export our DocPad Configuration
module.exports = docpadConfig