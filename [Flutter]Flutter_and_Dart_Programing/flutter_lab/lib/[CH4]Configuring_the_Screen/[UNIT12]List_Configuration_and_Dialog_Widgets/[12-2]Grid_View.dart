import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  List<String> citys = ['서울시', '용인시', '성남시', '수원시', '광주시', '안성시', '여주시', '이천시'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: GridView.builder(
          itemCount: citys.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [Text(citys[index]), Image.asset('images/big.jpeg')],
              ),
            );
          },
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        ),
      ),
    );
  }
}