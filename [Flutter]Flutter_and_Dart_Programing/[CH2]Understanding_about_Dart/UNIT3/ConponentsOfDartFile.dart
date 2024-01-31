/* 다트는 다른 언어와 달리 접근제한자가 없어 기본적으로 public 상태이다.
* 하지만, 변수나 함수 명 앞부분을 언더스코어 처리를 할 경우 다른 파일에서 접근할 수 없게 된다.
*/
//변수 선언
int no = 10;
int _no2 = 20;

//함수 선언
void sayHello() {
  print('hello, $no');
}
void _sayHello() { }


//클래스 선언
class User {
  int no = 10;

  //변수명 뒤에 ?를 붙여서 Nullable 처리
  String? name;
  String _address = 'Yongin';

  void sayHello(){
    print('world, $no');
  }
}

class _User2 { }

main() {
  int no = 20;
  int no2 = 30;

  sayHello();
  _sayHello();

  User user = User();
  _User2 user2 = _User2();

  user.name = 'kkang';
  user._address = 'busan';
}