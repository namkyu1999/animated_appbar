import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:animated_appbar/animated_appbar.dart';

void main() {
  const MethodChannel channel = MethodChannel('animated_appbar');

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
    expect(await AnimatedAppbar.platformVersion, '42');
  });
}
