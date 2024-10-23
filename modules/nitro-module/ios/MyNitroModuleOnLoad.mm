//
//  MyNitroModuleOnLoad.mm
//  NitroImage
//
//  Created by Marc Rousavy on 22.07.24.
//

#import <Foundation/Foundation.h>
#import <NitroModules/HybridObjectRegistry.hpp>
#import "HybridMyModuleSpec.hpp"

namespace margelo::nitro::mymodule {

class HybridMyModule: public HybridMyModuleSpec {
  double addNumbers(double a, double b) {
    return a + b;
  }
  
  std::string addStrings(const std::string& a, const std::string& b) {
    return a + b;
  }
};

}


@interface MyNitroModuleOnLoad : NSObject
@end

@implementation MyNitroModuleOnLoad

using namespace margelo::nitro;

+ (void)load {
  HybridObjectRegistry::registerHybridObjectConstructor(
      "MyModule",
      []() -> std::shared_ptr<HybridObject> {
        return std::make_shared<margelo::nitro::mymodule::HybridMyModule>();
      }
    );
}

@end
