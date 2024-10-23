#import "MyTurboModule.h"
#import <React-Codegen/MyTurboModuleJSI.h>
#include <ReactCommon/CxxTurboModuleUtils.h>

namespace facebook::react {

class MyTurboModuleCxx : public NativeMyTurboModuleCxxSpecJSI {
public:
  explicit MyTurboModuleCxx(std::shared_ptr<CallInvoker> jsInvoker): NativeMyTurboModuleCxxSpecJSI(jsInvoker) {
    
  };
  constexpr static auto kModuleName = "MyTurboModule";
  
  double addNumbers(jsi::Runtime &rt, double a, double b) {
    return a + b;
  };
  
  jsi::String addStrings(jsi::Runtime &rt, jsi::String a, jsi::String b) {
    std::string firstStr = a.utf8(rt);
    std::string secondStr = b.utf8(rt);
    return jsi::String::createFromUtf8(rt, firstStr + secondStr);
  };
};

}


@implementation MyTurboModule

+ (void)load {
  facebook::react::registerCxxModuleToGlobalModuleMap(
  std::string(facebook::react::MyTurboModuleCxx::kModuleName),
  [&](std::shared_ptr<facebook::react::CallInvoker> jsInvoker) {
  return std::make_shared<facebook::react::MyTurboModuleCxx>(jsInvoker);
});
}

//RCT_EXPORT_MODULE()
//
//- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
//    (const facebook::react::ObjCTurboModule::InitParams &)params
//{
//    return std::make_shared<facebook::react::NativeMyTurboModuleSpecJSI>(params);
//}
//
//- (NSNumber *)addNumbers:(double)a b:(double)b { 
//  NSNumber* number = [[NSNumber alloc] initWithDouble:a + b];
//  return number;
//}
//
//- (NSString *)addStrings:(NSString *)a b:(NSString *)b { 
//  NSMutableString* result = [[NSMutableString alloc] initWithString:a];
//  [result appendString:b];
//  return result;
//}

@end
