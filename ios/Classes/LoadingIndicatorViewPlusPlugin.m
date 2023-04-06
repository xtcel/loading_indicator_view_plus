#import "LoadingIndicatorViewPlusPlugin.h"
#if __has_include(<loading_indicator_view_plus/loading_indicator_view_plus-Swift.h>)
#import <loading_indicator_view_plus/loading_indicator_view_plus-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "loading_indicator_view_plus-Swift.h"
#endif

@implementation LoadingIndicatorViewPlusPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoadingIndicatorViewPlusPlugin registerWithRegistrar:registrar];
}
@end
