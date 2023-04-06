import 'package:flutter_test/flutter_test.dart';
import 'package:loading_indicator_view_plus/loading_indicator_view_plus_platform_interface.dart';
import 'package:loading_indicator_view_plus/loading_indicator_view_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLoadingIndicatorViewPlusPlatform
    with MockPlatformInterfaceMixin
    implements LoadingIndicatorViewPlusPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LoadingIndicatorViewPlusPlatform initialPlatform =
      LoadingIndicatorViewPlusPlatform.instance;

  test('$MethodChannelLoadingIndicatorViewPlus is the default instance', () {
    expect(
        initialPlatform, isInstanceOf<MethodChannelLoadingIndicatorViewPlus>());
  });

  test('getPlatformVersion', () async {
    // LoadingIndicatorViewPlus loadingIndicatorViewPlusPlugin = LoadingIndicatorViewPlus();
    // MockLoadingIndicatorViewPlusPlatform fakePlatform = MockLoadingIndicatorViewPlusPlatform();
    // LoadingIndicatorViewPlusPlatform.instance = fakePlatform;

    // expect(await loadingIndicatorViewPlusPlugin.getPlatformVersion(), '42');
  });
}
