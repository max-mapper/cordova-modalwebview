;(function(cordova) {

	function CordovaModalWebView() {}

	CordovaModalWebView.prototype.openURL = function(url, callback) {
	  if (!callback) callback = function() {}
		cordova.exec(callback, callback, "CordovaModalWebView", "openURL", [{url: url}])
	}

 	if (!window.plugins) window.plugins = {}
	window.plugins.modalWebView = new CordovaModalWebView()

})(window.cordova || window.Cordova || window.PhoneGap);
