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
    //sort는 void반환이라서 ..으로 값을 반환해주고 ..사용 후 동작을 하고싶으면 전체를 ()감싸기
    final dap1 = (transactions.where((e) => e.year == 2011).toList()
          ..sort(((a, b) => a.value.compareTo(b.value))))
        .map((e) => e.value);
    //Set는 중복을 허용하지 않기 때문에 Set으로 만들어서 중복 제거
    final dap2 = transactions.map((e) => e.trader.city).toSet();
    final dap3 = (transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.trader.name)
        .toSet()
        .toList()
          ..sort());
    final dap4 = (transactions
          ..sort(((a, b) => a.trader.name.compareTo(b.trader.name))))
        .map((e) => e.trader.name)
        .toSet()
        .toList();
    final dap5 = transactions.map((e) => e.trader.city).contains("Milan");
    final dap6 = transactions
        .where((e) => e.trader.city == 'Cambridge')
        .map((e) => e.value);
    //reduce와 max 함수 둘다 모양이 같아서 (a, b) => return 간단하게 사용가능
    final dap7 = transactions.map((e) => e.value).reduce(max);
    final dap8 = transactions.map((e) => e.value).reduce(min);

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(
        child: Column(
          children: [
            Text("1번 답: ${dap1.toString()}"),
            Text("2번 답: ${dap2.toString()}"),
            Text("3번 답: ${dap3.toString()}"),
            Text("4번 답: ${dap4.toString()}"),
            Text("5번 답: $dap5"),
            Text("6번 답: ${dap6.toString()}"),
            Text("7번 답: $dap7"),
            Text("8번 답: $dap8"),
          ],
        ),
      ),
    );
  }
}
