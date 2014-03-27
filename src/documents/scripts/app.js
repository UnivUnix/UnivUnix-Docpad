/* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
var disqus_shortname = 'univunix'; // required: replace example with your forum shortname

/* * * DON'T EDIT BELOW THIS LINE * * */
(function() {
  var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
  dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
  (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
})();

(function () {
  var s = document.createElement('script'); s.async = true;
  s.type = 'text/javascript';
  s.src = '//' + disqus_shortname + '.disqus.com/count.js';
  (document.getElementsByTagName('HEAD')[0] || document.getElementsByTagName('BODY')[0]).appendChild(s);
}());

//LAZYLOAD
$(document).ready(function() {
  $('img.lazy').show().lazyload({
    effect: "fadeIn",
    failureLimit: 6
  });
});

//ANALYTICS
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

ga('create', 'UA-37637477-1', 'univunix.com');
ga('send', 'pageview');

//ADSENSE
(adsbygoogle = window.adsbygoogle || []).push({});

//COOKIETOOL
CookieTool.Config.set('link','http://www.univunix.com/lssi.html');
CookieTool.API.impliedAgreement();