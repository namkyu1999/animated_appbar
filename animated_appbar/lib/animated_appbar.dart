
import 'dart:async';

import 'package:flutter/services.dart';

class AnimatedAppbar {
  static const MethodChannel _channel =
      const MethodChannel('animated_appbar');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
