import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  // 정확한 경로로 수정
  final ByteData data1 = await rootBundle.load('assets/images/tomatoes.png');
  final ByteData data2 = await rootBundle.load('assets/images/bibimbop.png');

  // (옵션) 불러왔다는 의미로 버퍼 처리
  ui.ImmutableBuffer buffer1 = await ui.ImmutableBuffer.fromUint8List(
    data1.buffer.asUint8List(),
  );
  ui.ImmutableBuffer buffer2 = await ui.ImmutableBuffer.fromUint8List(
    data2.buffer.asUint8List(),
  );

  return testMain();
}
