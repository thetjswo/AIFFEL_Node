import 'dart:typed_data';

/*********************[5-1-1]함수 선언 위치 알아보기*********************/
// 톱 레벨에 함수 선언
void some1() {}

void some2() {
  // 함수 내에 함수 선언
  void some3() {}
}

class MyClass {
  // 클래스의 멤버로 함수 선언
  void some4() {}

  // 다른 언어와 달리 다트는 아래와 같이 같은 이름을 쓰고, 매개변수가 다른 함수를 사용할 수 있는 함수 오버로딩을 제공하지 않는다.
  // void some4(int a) {}
}


/*********************[5-1-2]매개변수 타입*********************/
// 함수의 매개변수는 데이터의 타입 및 null 가능 여부를 지정할 수 있다.
void some5(int? a){
  print(a);
}
/*
* var로 선언한 변수의 경우, 대입한 값에 따라 컴파일러가 데이터 타입을 유추한다.
* 하지만, some6()함수의 매개변수는 컴파일 시점이 아닌, 함수 호출 시점에 값이 결정되어 컴파일 시점에서는 그 값을 유추하기 어렵다.
* 그렇기 때문에 var 타입의 매개변수는 dynamic의 성질을 갖게 된다.
*/
void some6(var a){
  print(a);
}
// 매개변수의 자료형을 생략하면 var로 선언한 것과 마찬가지이기 때문에 type은 dynamic이 된다.
void some7(a){
  print(a);
}


/*********************[5-1-3]함수의 반환 타입*********************/
// 반환값이 없는 함수
void some8() {print('void 함수 실행');}
// 반환값이 정수형인 함수
int some9(a) {
  return a;
}
// 반환값이 문자형인 함수
String some10(a) {
  return a;
}
// 반환값이 실수형인 함수
double some11(a) {
  return a;
}
// 반환값이 불리언인 함수
bool some12(a) {
  return a;
}
// 반환값이 바이트형인 함수
// Tip. 바이트 타입의 데이터는 앱 개발에서 데이터 통신 및 암호화 알고리즘을 사용할 때 자주 등장하는 자료형이므로,
// 바이트 다입을 핸들링하는 방법을 이해하는 것이 중요하다.
ByteData some13(a) {
  // 4바이트 크기의 버퍼 생성
  ByteData byteData = ByteData(4);

  // 정수를 바이트 버퍼에 쓰기
  byteData.setInt32(0, a);

  // 변환된 ByteData 반환
  return byteData;
}


/*********************[5-1-4]화살표 함수*********************/
/*
* 함수를 정의하는 부분에서 함수 내부에 작성되는 로직들은 {}로 묶어줘야하는 것이 다트의 문법이다.
* 하지만, 함수 내부에 구현되어있는 로직이 1줄 뿐이라면 {}를 생략하고 =>(애로우)를 통해 함수 내부의 코드임을 명시할 수 있다.
*/
void some14() => print('애로우 함수 실행');
// return은 해당하지 않는 것 같다.
// int some14(a) => return a;

main(){
  // [5-1-2] 실행 결과
  print('*********************[5-1-2] 실습 코드 출력*********************');
  some5(10);
  some5(null);
  // some5('hello'); 데이터 타입이 int로 결정됐기 때문에 String 타입의 인수는 오류를 발생시킨다.

  int? param1 = null;
  some6(param1);

  String param2 = 'Hello, World';
  some6(param2);
  print('\n');

  print('*********************[5-1-3] 실습 코드 출력*********************');
  int result1 = some9(10);
  String result2 = some10('Hello, World!');
  double result3 = some11(10.0);
  bool result4 = some12(true);
  ByteData result5 = some13(2024);
  int byte_to_integer = result5.getInt32(0);

  some8();
  print('정수형 함수 실행 - 반환 값: ${result1}(${result1.runtimeType})');
  print('문자형 함수 실행 - 반환 값: ${result2}(${result2.runtimeType})');
  print('실수형 함수 실행 - 반환 값: ${result3}(${result3.runtimeType})');
  print('불리언 함수 실행 - 반환 값: ${result4}(${result4.runtimeType})');
  print('바이트 함수 실행 - 반환 값: ${result5}(${result5.runtimeType})');
  print('바이트 함수 실행 반환 값을 정수형으로 변환: ${byte_to_integer}(${byte_to_integer.runtimeType})');
  print('\n');

  print('*********************[5-1-4] 실습 코드 출력*********************');
  some14();
}