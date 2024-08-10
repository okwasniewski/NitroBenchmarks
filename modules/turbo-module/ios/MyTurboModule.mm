#import "MyTurboModule.h"

@implementation MyTurboModule

RCT_EXPORT_MODULE()

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
    (const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeMyTurboModuleSpecJSI>(params);
}

- (NSNumber *)addNumbers:(double)a b:(double)b { 
  NSNumber* number = [[NSNumber alloc] initWithDouble:a + b];
  return number;
}

- (NSString *)addStrings:(NSString *)a b:(NSString *)b { 
  NSMutableString* result = [[NSMutableString alloc] initWithString:a];
  [result appendString:b];
  return result;
}

@end
