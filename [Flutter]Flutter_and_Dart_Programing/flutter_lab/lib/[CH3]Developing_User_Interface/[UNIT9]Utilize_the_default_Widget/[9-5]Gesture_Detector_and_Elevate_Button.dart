import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Column(
          children: [
            GestureDetector(
              child: Image.asset('images/icon/user.png'),
              onTap: () {
                print('image click...');
              },
              onVerticalDragStart: (DragStartDetails details) {
                print('vertical drag start...global position: ${details.globalPosition.dx}, ${details.globalPosition.dy}');
              },
            ),
            ElevatedButton(
              onPressed: () {
                print('ElevatedButton click...');
              },
              child: Text('Click me'),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),)
          ]
        )
      )
    );
  }
}