import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loading_indicator_view_plus/loading_indicator_view_plus_method_channel.dart';

void main() {
  MethodChannelLoadingIndicatorViewPlus platform = MethodChannelLoadingIndicatorViewPlus();
  const MethodChannel channel = MethodChannel('loading_indicator_view_plus');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
