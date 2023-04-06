import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'loading_indicator_view_plus_method_channel.dart';

abstract class LoadingIndicatorViewPlusPlatform extends PlatformInterface {
  /// Constructs a LoadingIndicatorViewPlusPlatform.
  LoadingIndicatorViewPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static LoadingIndicatorViewPlusPlatform _instance = MethodChannelLoadingIndicatorViewPlus();

  /// The default instance of [LoadingIndicatorViewPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelLoadingIndicatorViewPlus].
  static LoadingIndicatorViewPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LoadingIndicatorViewPlusPlatform] when
  /// they register themselves.
  static set instance(LoadingIndicatorViewPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
