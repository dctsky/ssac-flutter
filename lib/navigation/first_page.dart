import 'package:flutter/material.dart';
import 'package:flutter_lab_01/counter.dart';
import 'package:flutter_lab_01/navigation/second_page.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('화면전환'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name),
          ElevatedButton(  // 기본 버튼 위젯(최근 변경)
            onPressed: () {
              Navigator.push(  // 화면 전환. build에서 context 전달 받아야 함
                context,
                MaterialPageRoute(builder: (context) => SecondPage('값전달테스트')),
              );
            },
            child: Text('클릭'),
          ),
          RaisedButton(   // 옛날 기본 버튼 위젯
            onPressed: () {
              Future<String> future = Navigator.push(  // 화면 전환. build에서 context 전달 받아야 함
                context,
                MaterialPageRoute(builder: (context) => SecondPage('값전달테스트')),
              );
              future.then((value) {
                setState(() {
                  if (value != null)
                    name = value;
                  else
                    name = '';
                });
              });
            },
            child: Text('클릭'),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              name= '';
            });
          }, child: Text('reset'))
        ],
      ),
    );
  }
}
