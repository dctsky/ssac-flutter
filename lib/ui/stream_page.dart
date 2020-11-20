import 'package:flutter/material.dart';
import 'package:flutter_lab_01/stream/counter.dart';

class StreamPage extends StatelessWidget {
  final _counter = Counter(); //StreamController

  //periodic 1씩 증가시켜주는 기능
  //take는 뒤의 숫자 개수만큼만 갖겠다.
  final upCounter =
      Stream<int>.periodic(Duration(seconds: 1), (value) => value).take(11);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          '비동기 프로그래밍 - Stream',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          StreamBuilder<int>(
              stream: _counter.count,
              builder: (context, snapshot) {
                return Center(
                    child: Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 40),
                ));
              }),
          StreamBuilder<int>(
              stream: upCounter,
              builder: (context, snapshot) {
                return Center(
                    child: Text(
                  '${snapshot.data}',
                  style: TextStyle(fontSize: 40),
                ));
              }),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'f1',
              child: Icon(Icons.add),
              onPressed: () {
                //StreamBuilder에서 값을 관리하기때문에 setState() 필요없음
                _counter.increase();
              }),
          FloatingActionButton(
            heroTag: 'f2',
            child: Icon(Icons.remove),
            //onPressed와 _counter.decrease의 입력과 출력이 똑같을 때 간단하게 표현가능
            //둘다 입력값 void 반환값도 없음
            onPressed: _counter.decrease,
          ),
          FloatingActionButton(
            heroTag: 'f3',
            child: Icon(Icons.timer),
            //onPressed와 _counter.decrease의 입력과 출력이 똑같을 때 간단하게 표현가능
            //둘다 입력값 void 반환값도 없음
            onPressed: _counter.decrease,
          ),
        ],
      ),
    );
  }
}
