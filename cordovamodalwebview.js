;(function(cordova) {

	function CordovaModalWebView() {}

	CordovaModalWebView.prototype.showWebPage = function(url, callback) {
	  if (!callback) callback = function() {}
		cordova.exec(callback, callback, "CordovaModalWebView", "showWebPage", [{url: url}])
	}
		
	CordovaModalWebView.prototype.close = function() {
    cordova.exec(null, null, "CordovaModalWebView", "close", [])
  }

 	if (!window.plugins) window.plugins = {}
	window.plugins.modalWebView = new CordovaModalWebView()

})(window.cordova || window.Cordova || window.PhoneGap);
