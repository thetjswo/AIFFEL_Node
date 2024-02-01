/*********************[6-5-1] const로 생성자 선언*********************/
class MyClass {
  //상수 생성자가 선언된 클래스의 모든 멤버는 final로 선언이 되어야 한다.
  final int data1;

  // 상수 생성자는 본문을 가질 수 없어, {}를 추가할 수 없다.
  const MyClass(this.data1);
}

/*********************[6-5-2]const로 객체 생성*********************/
// 일반 클래스 정의
class MyClass1 {
  late int data1;

  MyClass(arg) {
    this.data1 = arg;
  }
}

/*********************[]*********************/

/*********************[]*********************/

/*********************[]*********************/

void main(List<String> args) {
  print('*********************[6-5-1] 실습 코드 출력*********************');
  MyClass obj1 = new MyClass(10);
  MyClass obj2 = new MyClass(20);

  print('object1: ${obj1.data1}, object2: ${obj2.data1}');
  print('\n');

  print('*********************[6-5-2] 실습 코드 출력*********************');
  // 상수 객체 생성
  MyClass obj3 = const MyClass(10);
  MyClass obj4 = const MyClass(10);

  // 일반 객체 생성
  MyClass obj5 = new MyClass(10);
  MyClass obj6 = new MyClass(10);

  // 초깃값이 다른 상수 객체
  MyClass obj7 = const MyClass(10);
  MyClass obj8 = const MyClass(20);

  // 하나는 상수 객체, 나머지 하나는 일반 객체
  MyClass obj9 = const MyClass(10);
  MyClass obj10 = MyClass(10);

  print('obj3 == obj4 : ${obj3 == obj4}');    // 객체와 생성자 모두 상수로 생성이 되었기 때문에 변수명이 달라도 두 변수는 각은 객체이다.
  print('obj5 == obj6 : ${obj5 == obj6}');    // 생성자는 상수 생성자이지만, 객체가 일반 객체이기 때문에 두 변수는 서로 다른 객체이다.
  print('obj7 == obj8 : ${obj7 == obj8}');    // 객체와 생성자 모두 상수여도, 초깃값을 다르게 주면 두 객체는 서로 다른 객체이다.
  print('obj9 == obj10 : ${obj9 == obj10}');  // 둘 다 상수객체가 아니면, 두 객체는 항시 서로 다른 객체이다.

  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  print('\n');
}