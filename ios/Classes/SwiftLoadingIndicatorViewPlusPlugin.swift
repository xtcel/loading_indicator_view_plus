import Flutter
import UIKit

public class SwiftLoadingIndicatorViewPlusPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "loading_indicator_view_plus", binaryMessenger: registrar.messenger())
    let instance = SwiftLoadingIndicatorViewPlusPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
