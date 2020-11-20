import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_lab_01/counter.dart';
import 'package:flutter_lab_01/model/album.dart';
import 'package:http/http.dart' as http;

//데이터 요청하는 메서드(앨범1개)
Future<Album> fetchAlbum() async { //await와 async는 한 셋트
  //await는 Future가 종료되는 것을 기다린다. async 키워드가 붙어있는 메서드 안에서만 사용 가능
  final http.Response response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

  if (response.statusCode == 200) { //200 정상코드
     //jsonDecode로 응답받은 값을 String에서 Map형태로 바꿔주는 것
    Map<String, dynamic> json = jsonDecode(response.body);
    // 변환된 Map형태의 json을 Album객체로 변환
    Album album = Album.fromJson(json);
    return album;
  } else {
    //에러가 나면 예외 발생시키고 종료 
    throw Exception('Failed to load album');
  }
}

//앨범을 여러개 가져오는 메서드
Future<List<Album>> fetchAlbumlist() async { //await와 async는 한 셋트
  //await는 Future가 종료되는 것을 기다린다. async 키워드가 붙어있는 메서드 안에서만 사용 가능
  final http.Response response = await http.get('https://jsonplaceholder.typicode.com/albums');

  if (response.statusCode == 200) { //200 정상코드
    //방법1
    // List<Album> albums = [];
    //
    // //jsonDecode로 응답받은 값을 String에서 Map형태로 바꿔주는 것
    final Iterable json = jsonDecode(response.body);
    //
    // // 변환된 Map형태의 json을 Album객체로 변환
    // json.forEach((element) {
    //   Album album = Album.fromJson(element);
    //   albums.add(album);
    // });
    //
    // return albums;

    //방법2 map
    return json.map((e) => Album.fromJson(e)).toList();


  } else {
    //에러가 나면 예외 발생시키고 종료
    throw Exception('Failed to load album');
  }
}

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  String result = '값 없음';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'HTTP',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(result),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Album album = await fetchAlbum(); //앨범 1개만 받기
          List<Album> albums = await fetchAlbumlist(); //앨범 여러개 받기
          setState(() {
            // result = album.toString();
            result = albums.toString();
          });
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
