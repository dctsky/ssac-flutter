import 'package:flutter/material.dart';
import 'package:flutter_lab_01/counter.dart';
import 'package:flutter_lab_01/list_exam.dart';
import 'package:flutter_lab_01/navigation/first_page.dart';
import 'package:flutter_lab_01/ui/main_page.dart';

void main() {
  runApp(MyApp());
}

//메인 App
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomePage(),
      // home: Counter(),
      // home: ListExam2(),
      // home: ListExam(),
      // home: FirstPage(),
      home: MainPage(),
    );
  }
}

//stless
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(); //빈 화면 위젯
    // return Text('Hello');

    //방법2 변수로 선언해서 사용(다른데서 더 쓸 일 없을 때)
    Widget titleSection = Padding( //바깥쪽에 여백 주기
      padding: const EdgeInsets.all(16.0), //여백 사이즈 조절
      child: Row( //수평으로 보여주기
        crossAxisAlignment: CrossAxisAlignment.start, //위로 위치 옮기기
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽으로 위치 옮기기
              children: [
                Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.red,
          ),
          Text('41'),
        ],
      ),
    );

    return Scaffold( //Material 디자인 기본 세팅
      appBar: AppBar(
        title: Text('Flutter layout demo'),
      ),
      //body: Column(
      body: ListView( //스크롤이 가능
        // child: Text('Hello'),
        children: [
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover, //틀에 최대한 맞추되 가장 작게 사이즈 조절
          ),
          TitleSection(),
          ButtonSection(),
          TextSection(),
        ],
      ),
    );

  }
}

//방법1 클래스로 분리(다른데서 여러번 쓸 때 좋음)
class TitleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding( //바깥쪽에 여백 주기
        padding: const EdgeInsets.all(16.0), //여백 사이즈 조절
        child: Row( //수평으로 보여주기
          crossAxisAlignment: CrossAxisAlignment.start, //위로 위치 옮기기
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽으로 위치 옮기기
                children: [
                  Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Kandersteg, Switzerland',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
            ),
            Text('41'),
          ],
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //방법3 메서드로 만들어서 사용
    Column _buildButtonColumn(Color color, IconData icon, String label) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Text(
            label,
            style: TextStyle(
                color: Colors.blue,
                fontSize: 14,
                fontWeight: FontWeight.w500

            ),
          ),
        ],
      );
    }
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, //공간을 균등하게 차지
        children: [
          _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
          _buildButtonColumn(Colors.blue, Icons.near_me, 'ROUTE'),
          _buildButtonColumn(Colors.blue, Icons.share, 'SHARE'),
        ],
      ),
    );
  }
}


class TextSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
            'Alps. Situated 1,578 meters above sea level, it is one of the '
            'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
            'half-hour walk through pastures and pine forest, leads you to the '
            'lake, which warms to 20 degrees Celsius in the summer. Activities '
            'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true, //열 너비에 맞춰 줄바꿈
        ),
        ),
    );
  }
}
