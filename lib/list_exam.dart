import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // title: 'Welcome to Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       // home: HomePage(),
//       home: HomePage(),
//     );
//   }
// }

//구분 선 있는 리스트 뷰 생성하기
class ListExam extends StatelessWidget {
  List<String> items = <String>['a', 'b', 'c', 'd', 'e', 'f', 'g','h','i','j','k','l','m','n'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Startup Name Generator'),
        ),
        body: ListView.separated(  //구분 선 있는 리스트 뷰 생성
        padding: const EdgeInsets.all(8),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(items[index]),
              );
            },
          //구분자 생성
            separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
    );
  }
}

//랜덤 단어 쌍 생성 후 구분자 있는 동적 리스트뷰 구현
class ListExam2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RandomWords(),
      ),
    );
  }
}
//stful
class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  final _suggestions = <WordPair>[];  //단어 쌍을 담을 변수
  final _biggerFont = TextStyle(fontSize: 18.0);
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    // return Text(wordPair.asPascalCase);//실행할때마다 단어쌍 생성
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      //body: _buildSuggestions(),
      body: _buildSuggestions2(),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
        //itemBuilder는 한번 단어쌍이 생성될 때 마다 호출 됨. 그리고 각 단어쌍을 ListTile 행에 배치한다.
        //짝수 행의 경우 단어 쌍을 위한 ListTile 행을 추가. 홀수 행의 경우, 분할 위젯을 추가. 즉 타일-분할선-타일-분할선...
          if (i.isOdd) return Divider();
          //ListView의 각 행이 나오기 전에 1픽셀 높이의 분할 위젯 추가.
          final index = i ~/ 2;  //  ~/는 몫을 구하는 연산자
          // example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. 분할선(1)-타일(2)-분할선(3)-타일(4)-분할선(5)-타일(6)
          // 분할 위젯을 뺀 실제 단어 쌍 수를 계산.
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
            //사용 가능한 단어 쌍이 끝나면 10개를 더 생성하여 단어쌍 목록에 추가.
          }
          return _buildRow(_suggestions[index]);
        }
    );
  }

  //ListView.separated + 랜덤 단어 쌍 생성
  Widget _buildSuggestions2() {
    return ListView.separated(
        padding: EdgeInsets.all(16.0),
        itemCount: _suggestions.length,
        itemBuilder: (context, i) {
          final index = i ~/ 2;  //  ~/는 몫을 구하는 연산자
          // example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2. 분할선(1)-타일(2)-분할선(3)-타일(4)-분할선(5)-타일(6)
          // 분할 위젯을 뺀 실제 단어 쌍 수를 계산.
          return _buildRow(_suggestions[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

  }

  Widget _buildRow(WordPair pair) { // ListTile을 생성
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}



