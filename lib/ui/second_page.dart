import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_lab_01/main.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(     //나중에 sliverAppBar 써보기
        // centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.black,
            ),
            Text(
              '영등포동4가',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: null)
        ],
      ),
      body: ListView(
        children: [
          _buildAdSection(),
          Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildWeatherSection()),
          Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: _buildInfoSection()),
        ],
      ),
    );
  }

  //text over image의 방법. Container의 decoration 속성에 이미지를 주고
  //child로 text를 준다. Stack 위젯에 각각 넣으라는 예제도 있었음
  Widget _buildAdSection() {
    return Container(
      width: 500,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/beach.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              '오서산 은빛 억새도 제철,',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10.0),
            child: Text(
              '보령 쪽빛 바다도 제철',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  //시간별 작은 날씨 아이콘 그려주는 메서드
  Widget _buildSmallItem(
      String time, IconData icon, Color color, String tem, String prob) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Icon(icon, color: color, size: 30),
          ),
          Text(
            tem,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            prob,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherSection() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '11월 1일 일요일 오후 7:51',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.cloud, size: 50, color: Colors.blue[200]),
            title: Text('15º', style: TextStyle(fontSize: 50)),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('대체로 흐림', style: TextStyle(color: Colors.grey)),
                Text('16º / 13º', style: TextStyle(color: Colors.grey)),
                Text('체감온도 15º', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.yellow[50], Colors.blue[100]])),
                child: Column(
                  children: [
                    Text('저녁에 가을비는 대부분 그치지만',
                        style: TextStyle(color: Colors.grey)),
                    Text('황사 유입으로 미세먼지 짙어요!',
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSmallItem(
                    '오후 9시', Icons.cloud, Colors.blue[200], '14º', '20%'),
                _buildSmallItem(
                    '오전 12시', Icons.cloud, Colors.blue[200], '11º', '20%'),
                _buildSmallItem(
                    '오전 3시', Icons.cloud, Colors.blue[200], '11º', '0%'),
                _buildSmallItem(
                    '오전 6시', Icons.wb_sunny, Colors.yellow[700], '19º', '0%'),
                _buildSmallItem(
                    '오전 9시', Icons.wb_sunny, Colors.yellow[700], '10º', '0%'),
              ],
            ),
          ),
          Center(
            child: RaisedButton(
              onPressed: () {},
              child: Text('더보기'),
              color: Colors.grey[200],
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
      IconData icon, Color color, String info1, String info2) {
    return ListTile(
        leading: Icon(icon, size: 30, color: color),
        title: Text(info1, style: TextStyle(fontSize: 15, color: Colors.grey)),
        trailing:
            Text(info2, style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)));
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        _buildInfoItem(Icons.wb_twighlight, Colors.yellow, '일출', '오전 6:58'),
        _buildInfoItem(Icons.wb_twighlight, Colors.yellow[700], '일몰', '오후 5:34'),
        _buildInfoItem(Icons.wb_sunny, Colors.yellow[700], '자외선지수', '보통(4)'),
        _buildInfoItem(Icons.ac_unit, Colors.blue[200], '습도', '95%'),
        _buildInfoItem(Icons.arrow_forward, Colors.grey[400], '바람', '1m/s'),
      ],
    );
  }
}
