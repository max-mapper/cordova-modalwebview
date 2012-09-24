/*
 * Copyright 2010 Facebook
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *    http://www.apache.org/licenses/LICENSE-2.0
 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "CordovaModalWebView.h"

///////////////////////////////////////////////////////////////////////////////////////////////////

@implementation CordovaModalWebView

@synthesize callbackIds = _callbackIds;

- (NSMutableDictionary*)callbackIds {
	if(_callbackIds == nil) {
		_callbackIds = [[NSMutableDictionary alloc] init];
	}
	return _callbackIds;
}

- (void)openURL:(NSMutableArray *)arguments withDict:(NSMutableDictionary *)options {
	[self.callbackIds setValue:[arguments pop] forKey:@"openURL"];
  NSString *url = [options objectForKey:@"url"] ?: @"";
  BOOL invisible = NO;
  _modalWebView = [[ModalWebView alloc] initWithURL:url
                                           params:[options objectForKey:@"params"]
                                  isViewInvisible:invisible
                                         delegate:self];
  [_modalWebView show];

  CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
	[self writeJavascript:[pluginResult toSuccessCallbackString:[self.callbackIds valueForKey:@"openURL"]]];	
}


- (void) dealloc {
	[_callbackIds dealloc];
	[super dealloc];
}

/**
 * Called when the dialog succeeds and is about to be dismissed.
 */
- (void)dialogDidComplete:(ModalWebView *)dialog
{

}

/**
 * Called when the dialog succeeds with a returning url.
 */
- (void)dialogCompleteWithUrl:(NSURL *)url
{

}

/**
 * Called when the dialog get canceled by the user.
 */
- (void)dialogDidNotCompleteWithUrl:(NSURL *)url
{

}

/**
 * Called when the dialog is cancelled and is about to be dismissed.
 */
- (void)dialogDidNotComplete:(ModalWebView *)dialog
{

}

/**
 * Called when dialog failed to load due to an error.
 */
- (void)dialog:(ModalWebView*)dialog didFailWithError:(NSError *)error
{

}

/**
 * Asks if a link touched by a user should be opened in an external browser.
 *
 * If a user touches a link, the default behavior is to open the link in the Safari browser,
 * which will cause your app to quit.  You may want to prevent this from happening, open the link
 * in your own internal browser, or perhaps warn the user that they are about to leave your app.
 * If so, implement this method on your delegate and return NO.  If you warn the user, you
 * should hold onto the URL and once you have received their acknowledgement open the URL yourself
 * using [[UIApplication sharedApplication] openURL:].
 */
- (BOOL)dialog:(ModalWebView*)dialog shouldOpenURLInExternalBrowser:(NSURL *)url
{
  return NO;
}


@end