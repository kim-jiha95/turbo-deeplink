#import "TurboDeeplink.h"
#import <React/RCTEventEmitter.h>
#import <UIKit/UIKit.h>

@implementation TurboDeeplink {
  NSURL *_initialURL;
}

RCT_EXPORT_MODULE()

- (NSArray<NSString *> *)supportedEvents {
  return @[@"url"];
}

RCT_EXPORT_METHOD(isSupported:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  resolve(@YES);
}


RCT_EXPORT_METHOD(canOpenURL:(NSString *)urlString
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  NSURL *url = [NSURL URLWithString:urlString];
  if (url) {
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
    resolve(@(canOpen));
  } else {
    reject(@"invalid_url", @"Invalid URL provided", nil);
  }
}

RCT_EXPORT_METHOD(openURL:(NSString *)urlString
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  NSURL *url = [NSURL URLWithString:urlString];
  if (!url) {
    reject(@"invalid_url", @"Invalid URL provided", nil);
    return;
  }
  
  [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
    resolve(@(success));
  }];
}

RCT_EXPORT_METHOD(getInitialDeepLink:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)
{
  if (!_initialURL) {
    resolve(@{ 
      @"url": [NSNull null],
      @"params": @{}
    });
    return;
  }
  
  NSURLComponents *components = [[NSURLComponents alloc] initWithURL:_initialURL resolvingAgainstBaseURL:YES];
  NSMutableDictionary *params = [NSMutableDictionary new];
  
  for (NSURLQueryItem *item in components.queryItems) {
    params[item.name] = item.value;
  }
  
  resolve(@{
    @"url": _initialURL.absoluteString,
    @"params": params
  });
}

- (void)handleOpenURL:(NSURL *)url
{
  _initialURL = url;
  [self sendEventWithName:@"url" body:@{
    @"url": url.absoluteString
  }];
}

@end
