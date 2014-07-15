//LAZYLOAD
$(document).ready(function() {
  $('img.lazy').show().lazyload({
    effect: "fadeIn",
    failureLimit: 6
  });
});

//ADSENSE
(adsbygoogle = window.adsbygoogle || []).push({});

//COOKIETOOL
CookieTool.Event.on('agree', function() {
  // Código que carga las cookies
  CookieTool.Utils.loadScript('/scripts/appc-min.js');
});
CookieTool.Config.set('link','https://www.univunix.com/lssi.html');
CookieTool.API.impliedAgreement();