import 'dart:async';

// Future - 단발성 비동기 호출
// Stream - 관찰형 비동기
void main() async {
  final controller = StreamController<int>();

  final Stream<int> stream = controller.stream;

  // 구독
  StreamSubscription<int> subscription = stream.listen((value) {
    print(value);
  });

  stream.listen((value) {
    print(value);
  });

  controller.add(1);
  await Future.delayed(Duration(seconds: 1));
  controller.add(2);
  await Future.delayed(Duration(seconds: 1));
  controller.add(3);

  subscription.cancel();
}
