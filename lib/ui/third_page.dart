import 'package:flutter/material.dart';
import 'package:flutter_lab_01/model/user.dart';
import 'package:flutter_lab_01/widget/kakao_list_tile.dart';
import 'package:flutter_lab_01/widget/my_list_tile.dart';
import 'package:flutter_lab_01/widget/user_detail_page.dart';

class ThirdPage extends StatelessWidget {
  List<User> _items = [
    User('사나', 20, imageUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAxODAzMDFfNzgg%2FMDAxNTE5OTAwODUzMDg3.LaMkkEKNCH8x3sIEZkxCjZL2FSW79BKLehTN_Htf_Gkg._Lh4ChgxHFU8B3ZGy6ThWfozmA3D_KPQq2mv1x_gc8Ig.JPEG.neverdie03%2FexternalFile.jpg&type=sc960_832'),
    User('나연', 25, imageUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fkinimage.naver.net%2F20181120_164%2F1542723564974ssbBM_JPEG%2F1542723564804.jpeg&type=sc960_832'),
    User('쯔위', 30, imageUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEwMDVfNzYg%2FMDAxNjAxODQ1NzIwODAw.PathCg6rTIVLRK1qc7dACnL-9Qs8zoC51dikIStJSjMg.zTR3MOm6DsxD-IkNXYoF1t6JqljRM6Uq16UOCILt5Gkg.JPEG.twicearchive%2Fc977cabc9b0ac0857dd19bbd140ed1c4.jpg&type=sc960_832'),
    User('채영', 30, imageUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAxOTA0MDVfMTAw%2FMDAxNTU0NDU4MzYwMjgy._Zg2ItLpKSd3mJgheodXtpnaYE3efJTTDRxttZo-Yiog.brZfOHZi0iUm4eQ7_ToPNN416mRYapA0jAYL82FYdzEg.JPEG.exia9133%2F10-2.JPG&type=sc960_832'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '친구 목록',
          style: TextStyle(color: Colors.black),
        ),
        // actions: [
        //   IconButton(icon: Icon(Icons.star), onPressed: () {}),
        // ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    //기존의 방식
    // List<Widget> result = [];
    // for(var i = 0; i < _items.length; i++) {
    //   User user =  _items[i];
    //   ListTile listTile = ListTile(title: Text(user.name));
    //   result.add(listTile);
    // }

    //함수형 프로그래밍2
    //위젯으로 분리
    // Widget _buildItem(User user) {
    //   return Column(
    //     children: [
    //       Image.asset('images/nabi.jpg',
    //       fit: BoxFit.fitWidth,),
    //       Row(
    //         children: [
    //           Text(user.name),
    //           Text('$user.age'),
    //         ],
    //       )
    //     ],
    //   );
    // }

    //함수형 프로그래밍1
    //mapping
    //_items에 있는 요소들 하나씩 ListTile로 만들고 toList로 반환
    // List<Widget> result = _items
    //     .map((user) => MyListTile(user))
    //     .toList();

    //children 안에 List<ListTile>인 형태
    return ListView(
      children: _items.map((user) {
        return InkWell(
          child: KakaoListTile(user),
          onTap: () {       //누르면 화면 전환
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDetailPage(user)),
            );
          },
        );
      }).toList(),
      // children: [
      //   ListTile(title: Text('1'),),
      //   ListTile(title: Text('2'),),
      //   ListTile(title: Text('3'),),
      // ],
    );
  }
}
