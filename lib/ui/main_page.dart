import 'package:flutter/material.dart';
import 'package:flutter_lab_01/ui/first_page.dart';
import 'package:flutter_lab_01/ui/second_page.dart';
import 'package:flutter_lab_01/ui/third_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _index = 0; //어떤 버튼을 눌렀는지 전달 받을 변수

  //_pages[_index]로 접근
  List<Widget> _pages = [
    FirstPage(), // _pages[0]
    SecondPage(), // _pages[1]
    ThirdPage(), // _pages[2]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_cloudy),
            label: '날씨',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '친구 목록',
          ),
        ],
        currentIndex: _index,
        onTap: (int value) {
          print('tapped : $value');
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
