#import "AnimatedAppbarPlugin.h"
#if __has_include(<animated_appbar/animated_appbar-Swift.h>)
#import <animated_appbar/animated_appbar-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "animated_appbar-Swift.h"
#endif

@implementation AnimatedAppbarPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAnimatedAppbarPlugin registerWithRegistrar:registrar];
}
@end
