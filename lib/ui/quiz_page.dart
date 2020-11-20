import 'dart:math';

import 'package:flutter/material.dart';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);

  @override
  String toString() {
    return '$name, $city}';
  }
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);

  @override
  String toString() {
    return '{${trader.toString()}, $year, $value}\n';
  }
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('title'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                  "1번 답: ${(transactions.where((e) => e.year == 2011).toList()..sort(((a, b) => a.value.compareTo(b.value)))).map((e) => e.value).toString()}"),
              Text("2번 답: ${transactions.map((e) => e.trader.city).toSet().toString()}"),
              Text(
                  "3번 답: ${(transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.trader.name).toSet().toList()..sort()).toString()}"),
              Text("4번 답: ${(transactions..sort(((a, b) => a.trader.name.compareTo(b.trader.name)))).map((e) => e.trader.name).toSet().toList().toString()}"),
              transactions.map((e) => e.trader.city).contains("Milan")
                  ? Text("5번 답: true")
                  : Text("5번 답: false"),
              Text(
                  "6번 답: ${transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.value).toString()}"),
              Text("7번 답: ${transactions.map((e) => e.value).reduce(max)}"), //reduce와 max 함수 둘다 모양이 같아서 (a, b) => return 간단하게 사용가능
              Text("8번 답: ${transactions.map((e) => e.value).reduce(min)}"),
            ],
          ),
        ));
  }

}
