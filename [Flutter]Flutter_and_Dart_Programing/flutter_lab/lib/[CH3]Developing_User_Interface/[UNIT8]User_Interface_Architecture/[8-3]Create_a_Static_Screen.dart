import 'package:flutter/material.dart';

void main() {
  // MyApp 객체 생성
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool enabled = false;
  String stateText = 'disable';

  // 플래그 변경 메서드 정의
  void changeCheck() {
    //플래그가 true이면 false로 바꾸고, 그 반대의 경우에는 true로 바꿈
    if (enabled) {
      stateText = 'disable';
      enabled = false;
    } else {
      stateText = 'enable';
      enabled = true;
    }
  }

  @override
  //화면 생성
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateless Text'),  //상단바 제목
        ),
        body: Center( //본문 영역 가운데 정렬
          child: Row( //세로로?
            mainAxisAlignment: MainAxisAlignment.center,  //주축을 기준으로 가운데 정렬?
            children: [
              IconButton( //아이콘 버튼 생성
                icon: (enabled ? Icon(Icons.check_box, size: 20,) :     //플래그가 true이면 체크된 박스를
                      Icon(Icons.check_box_outline_blank, size: 20,)),  // false이면 빈 박스를 노출
                color: Colors.red,  // 색은 빨간색
                onPressed: changeCheck, // 클릭되면(터치되면) changeCheck 함수 호출(플래그 변경)
              ),
              Container(  //버튼 옆에 빈 영역 생성
                padding: EdgeInsets.only(left: 16), //버튼 옆 16px 지점?
                child: Text('$stateText', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),  //지정된 스타일의 텍스트 출력
              ),
            ],
          ),
        )
      )
    );
  }
}