import 'package:flutter/material.dart';
import 'package:flutter_lab_01/model/album.dart';
import 'http_page.dart';

class AsyncPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          '비동기 프로그래밍 - Future',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<Album>>(
        future: fetchAlbumlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(child: Text(snapshot.data.toString()));
          } else if (snapshot.hasData) {
            return Center(child: Text('에러 발생'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
