import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lab_01/ui/provider/counter.dart';

class CounterProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: Center(
          child: Text(
            '${counter.count}',
            style: TextStyle(fontSize: 40),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                heroTag: 'f1',
                child: Icon(Icons.add),
                onPressed: () {
                  counter.increase();
                }),
            FloatingActionButton(
                heroTag: 'f2',
                child: Icon(Icons.remove),
                onPressed: () {
                  counter.decrease();
                }),
          ],
        ));
  }
}
