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

- (void) dialogDidSucceed:(NSURL*)url {

}

- (void) dealloc {
	[_callbackIds dealloc];
	[super dealloc];
}


@end