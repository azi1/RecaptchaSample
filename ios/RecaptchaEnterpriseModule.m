//
//  RecaptchaEnterpriseModule.m
//  NativeModuleTest
//
//  Created by rakbank on 26/12/2022.
//

#import <Foundation/Foundation.h>
#import "React/RCTBridgeModule.h"


@interface
RCT_EXTERN_MODULE(RecaptchaEnterpriseModule, NSObject)

RCT_EXTERN_METHOD(execute)


RCT_EXTERN_METHOD(loadcaptcha: (NSString *)captchaKey
                  resolver:(RCTPromiseResolveBlock)resolve
                  rejecter:(RCTPromiseRejectBlock)reject
                  )

@end

