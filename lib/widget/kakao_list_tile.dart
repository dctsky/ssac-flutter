import 'package:flutter/material.dart';
import 'package:flutter_lab_01/model/user.dart';

class KakaoListTile extends StatelessWidget {
  final User user;

  KakaoListTile(this.user);

  @override
  Widget build(BuildContext context) {
    return _buildItem(user);
  }

  Widget _buildItem(User user) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(70.0),
                child: Image.network('${user.imageUrl}',
                  width: 65,
                  height: 65,
                  fit: BoxFit.cover,
                  ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: TextStyle(fontSize: 18)),
                      Text('${user.age}',style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),

      ],
    );
  }
}
