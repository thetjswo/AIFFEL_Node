/*
* 다트 파일이 같은 lib 디렉터리 내에 있을 때에는 상대 경로로 import가 가능하지만, lib 밖에 있는 파일의 경우,
* 상대 경로가 아닌 package 접두사 혹은 dart 접두사로 import를 해야 한다.

* import 'package:com.example.OtherPackage.test.dart'; 패키지 접두사로 파일 import
* import 'dart:core'; 기본 제공 라이브러리 import
* import './ConponentsOfDartFile.dart'; 상대 경로로 파일 import
* import 'ConponentsOfDartFile.dart';
* 식별자에 별칭을 정의하여 사용할 수도 있다.
*/
import '[3-1]Conponents_of_Dart_file.dart' as Cof;

/*  show 예약어를 사용하여 특정 요소들만 import 할 수 있다.
그 외에 특정 요소만 제외를 하는 경우에는 hide 예약어를 사용한다.
 */
import '[3-1]Conponents_of_Dart_file.dart' show User;
import '[3-3]Create_Library.dart';

main() {
  int no = Cof.no;
  //'no' 변수 출력
  print('$no');
  //sayHello 함수 호출
  Cof.sayHello();

  // User 클래스 객체 생성
  User user = User();
  // User 클래스의 sayHello 메서드 호출
  user.sayHello();

  //라이브러리에 포함된 변수 출력
  print('$a_data, $b_data');
}