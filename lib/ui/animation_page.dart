import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                _height = 200;
              });
            },
            child: Text('변환'),
          ),
          AnimatedContainer(
            curve: Curves.bounceInOut,
            width: 100,
            height: 100,
            color: Colors.brown[300],
            duration: Duration(seconds: 1),
          )
        ],
      ),
    );
  }
}
