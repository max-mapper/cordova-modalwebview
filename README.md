this is an experimental cordova plugin. `ModalWebView` is forked from the facebook iOS SDK (apache licensed)

    window.plugins.modalWebView.showWebPage('http://www.google.com')
    
    window.plugins.modalWebView.showWebPage('http://www.google.com', function(resp) {
      // resp will have a `type` that is either CLOSE_EVENT or LOCATION_CHANGED_EVENT
      // if LOCATION_CHANGED_EVENT then there will also be a `location` with the new URL
    })
