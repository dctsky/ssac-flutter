import 'package:flutter/material.dart';
import 'package:flutter_lab_01/counter.dart';
import 'package:http/http.dart' as http;

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
        onPressed: () {},
        child: Icon(Icons.send),
      ),
    );
  }
}
