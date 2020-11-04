import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Kakao T',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView(
          children: [
            _buildMenuSection(),
            _buildAdSection(),
            _buildNoticeSection(),
          ],
        ));
  }

  Widget _buildItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(
            icon,
            size: 60,
            color: Colors.yellowAccent[700],
          ),
          Text(
            title,
            style: TextStyle(
              color: Colors.brown,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        Container(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildItem(Icons.local_taxi, '택시'),
            _buildItem(Icons.car_rental, '블랙'),
            _buildItem(Icons.bike_scooter, '바이크'),
            _buildItem(Icons.person, '대리'),
          ],
        ),
        Container(
          //약간의 빈공간을 주는 용도. 비슷한걸로 SizedBox도 있음
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildItem(Icons.local_parking, '주차'),
            _buildItem(Icons.people, '카풀'),
            _buildItem(Icons.arrow_forward, '내비'),
            Opacity(
                // 보이지 않게
                opacity: 0.0,
                child: _buildItem(Icons.person, '대리')),
          ],
        ),
      ],
    );
  }

  Widget _buildAdSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
      child: CarouselSlider(
          items: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              fit: BoxFit.cover, //틀에 최대한 맞추되 가장 작게 사이즈 조절
            ),
            Image.asset(
              'images/nabi.jpg',
              width: 600,
              fit: BoxFit.cover, //틀에 최대한 맞추되 가장 작게 사이즈 조절
            ),
            Image.asset(
              'images/seol.jpg',
              width: 600,
              fit: BoxFit.cover, //틀에 최대한 맞추되 가장 작게 사이즈 조절
            ),
            // Container(color: Colors.red),
            // Container(color: Colors.blue),
            // Container(color: Colors.green),
          ],
          options: CarouselOptions(
            height: 200.0,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 500),
          )),
    );
  }

  Widget _buildNoticeSection() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.info),
          title: Text('[공지]업데이트 안내'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('[공지]업데이트 안내'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('[공지]업데이트 안내'),
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('[공지]업데이트 안내'),
        )
      ],
    );
  }
}
