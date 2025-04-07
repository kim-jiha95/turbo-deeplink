#import <React/RCTEventEmitter.h>
#import <React/RCTBridgeModule.h>

@interface TurboDeeplink : RCTEventEmitter <RCTBridgeModule>

// 외부에서 호출할 수 있는 URL 처리 메서드
- (void)handleOpenURL:(NSURL *)url;

// 옵셔널: 싱글톤 인스턴스 접근을 위한 메서드
+ (instancetype)shared;

@end
