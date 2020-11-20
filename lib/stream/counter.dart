import 'dart:async';

class Counter {
  var _count = 0;

  //데이터가 흐르는 통로
  //처음 실행하면 null값 이기때문에 0을 넣어줘야함.
  //..은 뒤의 내용 실행하고 return 하겠다는 뜻
  final _controller = StreamController<int>()..add(0);

  //또는 시작값 0은 생성자에서 넣어줄 수 있음
  // Counter() {
  //   _controller.add(0);
  // }

  //set이 안되게 설정
  Stream<int> get count => _controller.stream; // 값이 여기로 나감

  // Stream<int> countStream() {
  //   return _controller.stream;
  // }

  void increase() {
    _count++;
    _controller.add(_count);
  }
  void decrease() {
    _count--;
    _controller.add(_count);
  }
}
