import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test'),),
        body: ChildWidget(),
      ),
    );
  }

}

class ChildWidget extends StatefulWidget {
  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  /*
  * State 객체가 생성되자마자 최초 1회 호출
  * 상태값 초기화 로직 작성에 용이  ex) 화면이 켜질 때, 최초 1회 서버와 연동하여 데이터를 초기화 시킬 때 사용
  * 이벤트를 처리하는 리스너를 한 번만 등록하고, 그 이후엔 콜백 함수만 반복해서 호출
  * ex) 앱이 화면에 출력되는 순간이나 화면에서 사라지는 순간에 이벤트를 처리할 때 사용
  */
  @override
  void initState() {
    super.initState();
  }

  /*
  * initState() 함수가 호출된 후에 이어서 호출, 즉 state가 생성될 때 자동으로 호출 되며,
  * 이 함수는 반복해서 호출이 가능
  * 상위 위젯의 상태 데이터를 하위 위젯에 전달해야 할 때, InheritedWidget이나 Provider를 사용
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  /*
  * 상태 객체가 소멸될 때 자동으로 호출.
  * 쉽게 말해 화면이 생성될 때 initState()가 최초로 호출 된다면, 화면이 사라질 때 dispose()가 최후로 호출된다.
  * Tip. 화면이 종료되는 시점에 특정 기능을 실행하고 싶어서 dispose()함수 내부에 로직을 구현해 놓아도 그 로직은 실행이 안 될 가능성이 높다.
  *      왜냐하면, 위젯의 생명주기 상 dispose() 함수가 호출됨과 동시에 내부 로직이 실행되기 전에 위젯의 수명이 끝날 수 있기 때문이다.
  */
  @override
  void dispose() {
    super.dispose();
  }

  /*
  * StatefulWidget에 변화가 생기면 이를 감지하여 didUpdateWidget()이 자동으로 호출된다.
  * 이 점을 활용하여 didUpdateWidget()함수 내부에 변화가 있을 때 어떤한 동작을 진행하는 로직을 구현해 놓을 수 있다.
  * ex) 시간의 흐름에 따른 배경 색 변경 (낮이면 라이트 모드, 밤이면 다크 모드)
  */
  @override
  void didUpdateWidget(covariant ChildWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  /*
  * build()함수는 화면을 구성할 때 호출되는 함수로, 해당 함수가 호출되는 3가지 경우는 다음과 같다.
  *
  *   - 최초 호출
  *   initState() -> didChangeDependencies() -> build() 순으로 호출이 되어야지 화면이 노출(Clean 상태)된다.
  *
  *   - setState() 함수에 의한 호출
  *   State 자체의 내용이 변경되어 setState() 함수를 호출 했을 때 Clean에서 Dirty 상태로 변경이 된다.
  *   이 때 Dirty 상태가 되면 자동으로 build() 함수를 호출하여 현재 상태로 화면을 다시 구성하게 된다.
  *
  *   - didUpdateWidget() 함수에 의한 호출
  *   didUpdateWidget() 함수가 호출되면 State는 자동으로 Dirty 상태가 되며 build() 함수가 다시 호출된다.
  */
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}