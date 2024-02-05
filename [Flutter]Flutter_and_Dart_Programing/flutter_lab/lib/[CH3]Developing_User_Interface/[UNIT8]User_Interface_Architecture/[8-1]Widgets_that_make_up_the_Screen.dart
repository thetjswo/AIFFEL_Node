import 'package:flutter/material.dart';

void main() {
  // MyApp 객체 생성
  runApp(MyApp());
}

// StatelessWidget 상속
class MyApp extends StatelessWidget {

  @override
  // 화면 생성
  Widget build(BuildContext context){
    return MaterialApp(   // 머티리얼 디자인 적용
      home: Scaffold(     // 화면 디자인 설계
        appBar: AppBar(   // 화면 위쪽 앱바 구성
          title: Text('Test'),    // 앱바의 제목
        ),
        body: Center(child: GestureDetector(child: Text('HelloWorld'))),  //Center: 가운데 정렬, GestureDetector: 사용자 이벤트 처리, Text: 본문에 문자 출력
      ),
    );
  }
}