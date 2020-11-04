import 'package:flutter/material.dart';
import 'package:flutter_lab_01/model/user.dart';

class UserPhotoPage extends StatelessWidget {
  final User user;

  UserPhotoPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body:
      Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: user,
            child: Image.network(user.imageUrl),
          ),
        ],
    ),
      ),);
  }
}
