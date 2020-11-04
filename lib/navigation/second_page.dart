import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String name;

  //생성자
  // SecondPage(String name) {
  //   this.name = name;
  // }
  //생성자(더 간편한 버전)
  SecondPage(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두번째 화면 전환 $name'),
      ),
      body: Column(

        children: [
          ElevatedButton(
            onPressed: () {
              //전환된 화면을 닫고 원래 화면으로 돌아가기
              //Navigator.pop(context);
              //값 전달 하면서 닫기
              Navigator.pop(context, '전달 성공!');
            },
            child: Text('닫기'),
          ),
        ],
      ),
    );
  }
}
