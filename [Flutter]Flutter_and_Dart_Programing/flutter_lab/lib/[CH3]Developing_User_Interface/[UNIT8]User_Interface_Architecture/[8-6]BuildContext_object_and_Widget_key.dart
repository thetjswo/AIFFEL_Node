import 'package:flutter/material.dart';

void main() {                                                                   // 6. main() 함수 호출
  runApp(MyApp());                                                              // 7. MyApp 객체 생성
}

class MyApp extends StatelessWidget {                                           // 1. MyApp() 클래스 컴파일
  @override
  Widget build(BuildContext context) {                                          // 8. StatelessWidget을 상속하여 화면 생성
    return MaterialApp(                                                         // 9. MaterialApp 반환
      home: MyListWidget()                                                      //    - MyListWidget 객체 생성
    );
  }
}

class MyListWidget extends StatefulWidget {                                     // 2. MyListWidget 클래스 컴파일
  @override
  State<StatefulWidget> createState() {                                         // 10. StatefulWidget을 상속하여 state 생성
    return _MyListWidgetState();                                                // 11. _MyListWidgetState() 객체를 생성하고 반환
  }
}

class _MyListWidgetState extends State<MyListWidget> {                          // 3. _MyListWidgetState 클래스 컴파일
  List<Widget> widgetList = [                                                   // 12. widgetList 선언 및 초기화 - 인자의 자료형은 Widget
    MyColorItemWidget(Colors.red, key: UniqueKey(),),                           // 8. MyColorItemWidget 객체 생성
    MyColorItemWidget(Colors.blue, key: UniqueKey()),
  ];

  onChange() {
    print(widgetList.elementAt(0).key);
    setState(() {
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('key Test'),),
      body: Column(
        children: [
          Row(children: widgetList,),
          ElevatedButton(onPressed: onChange, child: Text('toggle'))
        ]
      )
    );
  }
}

class MyColorItemWidget extends StatefulWidget {                                // 4. MyColorItemWidget 클래스 컴파일
  Color color;                                                                  //
  MyColorItemWidget(this.color, {Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyColorItemWidgetState(color);
  }
}

class _MyColorItemWidgetState extends State<MyColorItemWidget> {                // 5. _MyColorItemWidgetState 클래스 컴파일
  Color color;
  _MyColorItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      )
    );
  }
}