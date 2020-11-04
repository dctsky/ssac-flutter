import 'package:flutter/material.dart';
import 'package:flutter_lab_01/model/user.dart';
import 'package:flutter_lab_01/widget/user_photo_page.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  UserDetailPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, //body영역이 appbar까지 포함하게 늘어남
      extendBody: true,
      appBar: AppBar(
        // toolbarHeight: 0,
        // centerTitle: true,
        backgroundColor: Colors.transparent, //appbar가 약간 투명해지면서 body 배경이 보이게
        // title: Text(
        //   '내 정보',
        //   style: TextStyle(color: Colors.black),
        // ),
      ),
      body: Container(
        width: 500,
        height: 1000,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.darken,
          image: DecorationImage(
            image: NetworkImage(user.imageUrl),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.black45, BlendMode.darken), //배경을 약간 흐리게 효과 주기
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserPhotoPage(user)),
                      );
                    },
                    child: Hero(
                      tag: user,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image.network(
                          '${user.imageUrl}',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItem(
      String time, IconData icon, Color color, String tem, String prob) {}
}
