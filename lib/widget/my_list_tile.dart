import 'package:flutter/material.dart';
import 'package:flutter_lab_01/model/user.dart';

class MyListTile extends StatelessWidget {
  final User user;

  MyListTile(this.user);

  @override
  Widget build(BuildContext context) {
    return _buildItem(user);
  }

  Widget _buildItem(User user) {
    return Column(
      children: [
        Image.asset('images/nabi.jpg',
          width: 60,
          fit: BoxFit.cover,),
        Row(
          children: [
            Text(user.name),
            Text('${user.age}'),
          ],
        )
      ],
    );
  }
}
