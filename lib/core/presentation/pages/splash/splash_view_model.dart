import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:recipe_app/core/presentation/pages/splash/splash_event.dart';

class SplashViewModel with ChangeNotifier {
  final _eventController = StreamController<SplashEvent>();

  Stream<SplashEvent> get eventStream => _eventController.stream;

  SplashViewModel();
}
