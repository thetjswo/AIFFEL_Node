/*********************[6-1-1]클래스 선언과 생성*********************/
class User {
  String name = 'seonjae';
  int age = 10;

  void sayHello() {
    print('Hello $name, age: $age');
  }
}
/*********************[6-1-2]객체 멤버와 클래스 멤버*********************/
class MyClass {
  //클래스의 객체 멤버
  String data1 = 'hello';
  //클래스의 클래스 멤버
  static String data2 = 'hello';

  //클래스의 객체 멤버
  myFunc1() => print('myFunc1 call...');
  //클래스의 클래스 멤버
  static myFunc2() => print('myFunc2 call...');
}


void main(List<String> args) {
  print('*********************[6-1-1] 실습 코드 출력*********************');
  // User 객체 생성
  User user = new User();
  // User 객체의 sayHello 메서드 호출
  user.sayHello();
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  // MyClass 객체 생성
  MyClass my_class = new MyClass();

  // 클래스의 객체 멤버는 클래스 객체 생성 후, 객체를 통해서 호출이 가능하다.
  print('data1: ${my_class.data1}');
  my_class.myFunc1();

  // 클래스의 클래스 멤버는 클래스 자체를 통해서만 호출이 가능하다.
  print('data2: ${MyClass.data2}');
  MyClass.myFunc2();
  print('\n');
}