import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'loading_indicator_view_plus_platform_interface.dart';

/// An implementation of [LoadingIndicatorViewPlusPlatform] that uses method channels.
class MethodChannelLoadingIndicatorViewPlus extends LoadingIndicatorViewPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('loading_indicator_view_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
