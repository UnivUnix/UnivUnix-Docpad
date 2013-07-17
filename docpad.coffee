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

			# The website description (for SEO)
			description: """
				Una web donde te pondremos al día en la información que rodea a Linux y programación: noticias, tutoriales y software variado e interesante.
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				place, your, website, keywoards, here, keep, them, related, to, the, content, of, your, website
				"""

			# The website author's name
			author: "Aglezabad"

			# The website author's email
			email: "aglezabad@gmail.com"

			# Styles
			styles: [
				"/styles/twitter-bootstrap.css",
				"/styles/style.css"
			]

			# Scripts
			scripts: [
				"/scripts/jquery-min.js",
				"/scripts/lazyload-min.js",
				"/vendor/twitter-bootstrap/js/bootstrap-dropdown.js",
				"/vendor/twitter-bootstrap/js/bootstrap-collapse.js"
			]


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
				"#{@site.title} | El portal unificado de Unix y Linux."

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

	# =================================
	# Collections
	# These are special collections that our website makes available to us
	
	collections:
	  
    pages: (database) ->
      database.findAllLive({pageOrder: $exists: true}, [pageOrder:1,title:1])

    indexes: (database) ->
      database.findAllLive({index: true}, [indexOrder:1, title:1])

    posts: (database) ->
      database.findAllLive({categories:$in:['linux','arch','debian','fedora','mageia','mint','opensuse','ubuntu','programacion','tutoriales','noticias']}, [date:-1])

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
}


# Export our DocPad Configuration
module.exports = docpadConfig