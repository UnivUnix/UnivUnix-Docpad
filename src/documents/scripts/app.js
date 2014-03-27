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
  // Por elemplo:
  CookieTool.Utils.loadScript('/scripts/libs/isogram.js');
  CookieTool.Utils.loadScript('/scripts/libs/disqus.js');
});
CookieTool.Event.on('decline', function() {
  // Borrar las cookies si es posible:
  CookieTool.Cookie.remove('I4SUserLocale');
  CookieTool.Cookie.remove('GAPS');
  CookieTool.Cookie.remove('PREF');
  CookieTool.Cookie.remove('SID');
  CookieTool.Cookie.remove('HSID');
  CookieTool.Cookie.remove('SSID');
  CookieTool.Cookie.remove('APISID');
  CookieTool.Cookie.remove('SAPISID');
  CookieTool.Cookie.remove('NID');
  CookieTool.Cookie.remove('SNID');
});
CookieTool.Config.set('link','http://www.univunix.com/lssi.html');
CookieTool.API.impliedAgreement();