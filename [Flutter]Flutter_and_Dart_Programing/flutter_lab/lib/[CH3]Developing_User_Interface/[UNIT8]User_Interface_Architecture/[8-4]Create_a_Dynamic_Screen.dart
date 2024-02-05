import 'package:flutter/material.dart';

void main() {
  //MyApp 객체 생성
  runApp(MyApp());
}

/*
 * StatelessWidget:
 * 상태를 가지지 않는 위젯으로, 한 번 그려진 후에는 내부 상태가 변경되지 않는다.
 * 주로 화면에 고정된 데이터를 표시하는 데 사용된다.
 * build 메서드 내에서 구성된 정보에 따라 UI를 생성하며, 한 번 생성된 후에는 변경되지 않는다.
 * ex) 정적인 텍스트, 아이콘, 이미지 등을 표시하는 데 사용
 *
 * StatefulWidget:
 * 상태를 가지는 위젯으로 내부에 변경 가능한 상태를 갖고, 그 상태에 따라 화면이 업데이트될 수 있다.
 * 사용자 상호 작용 또는 외부 데이터의 변화에 따라 동적인 UI를 만들 때 주로 사용된다.
 * State 클래스를 함께 사용하여 상태를 유지하고, setState 메서드를 사용하여 상태의 변경을 알립니다.
 * ex) 사용자가 버튼을 클릭하면 카운트가 증가하는 등의 동적인 동작을 수행할 때 사용
 *
 * 간단히 말해, StatelessWidget은 정적인 정보를 표시하는 데 사용되며, 한 번 생성된 후에는 내부 상태가 변하지 않는다.
 * 반면에, StatefulWidget은 동적이고 변경 가능한 상태를 갖고, 사용자 상호 작용이나 외부 데이터의 변화에 따라 화면을 업데이트할 수 있다.
 */

// StatelessWidget 상속
class MyApp extends StatelessWidget {

  @override
  // 화면 생성
  Widget build(BuildContext context) {
    return MaterialApp(   // 화면 구조 지정
      home: Scaffold(   // 홈 화면 형식 지정
        appBar: AppBar(   // 상단바 형식 지정
          title: Text('Stateful Test'),   //상단바에 노출될 텍스트 지정
        ),
        body: MyWidget(),   //MYWidget 객체 생성
      ),
    );
  }
}

// StatefulWidget 상속
class MyWidget extends StatefulWidget {

  @override
  // state 생성
  State<StatefulWidget> createState() {
    // _MyWidgetState()객체 생성
    return _MyWidgetState();
  }
}

// [8-3]Create_a_Static_Screen의 코드와 동일
class _MyWidgetState extends State<MyWidget> {
  bool enabled = false;
  String stateText = 'disable';

  void changeCheck() {
    setState(() {
      if (enabled) {
        stateText = 'disabled';
        enabled = false;
      }else {
        stateText = 'enable';
        enabled = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: (enabled
                ? Icon(
              Icons.check_box,
              size: 20,
            )
                : Icon(
              Icons.check_box_outline_blank,
              size: 20,
            )),
            color: Colors.blue,
            onPressed: changeCheck,
          ),
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              '$stateText',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}