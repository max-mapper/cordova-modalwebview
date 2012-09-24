;(function(cordova) {

	function CordovaModalWebView() {
	  this.onLocationChange = function() {}
	}

	CordovaModalWebView.prototype.showWebPage = function(url, callback) {
	  var self = this
	  if (!callback) callback = function() {}

	  // conform to the existing childbrowser API
	  function callbackWrapper = function(resp) {
	    if (resp.location) self.onLocationChange(resp.location)
	    callback(resp)
	  }

		cordova.exec(callbackWrapper, callbackWrapper, "CordovaModalWebView", "showWebPage", [{url: url}])
	}
		
	CordovaModalWebView.prototype.close = function() {
    cordova.exec(null, null, "CordovaModalWebView", "close", [])
  }

 	if (!window.plugins) window.plugins = {}
	window.plugins.childBrowser = new CordovaModalWebView()

})(window.cordova || window.Cordova || window.PhoneGap);
