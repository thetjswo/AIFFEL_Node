/*********************[6-2-1]생성자 선언*********************/
// 생성자 생성 예제
class User {
  // 해당 값들을 생성자의 매개변수로 받아서 저장할 것이기 때문에 late로 지정한다.
  late String name;
  late int age;

  User(String name, int age) {
    // 매개변수로 받은 값을 객체 멤버에 대입
    this.name = name;
    this.age = age;
  }

  sayHello() => print('name: ${this.name}, age: ${this.age}');
}

/*********************[6-2-2]초기화 목록*********************/
class MyClass {
  late int data1;
  late int data2;

  // 초기화 목록 정의
  MyClass(List<int> args)
      : this.data1 = calFun(args[0]),
        this.data2 = calFun(args[1]) {}

  // 클래스 멤버인 calFun() 메서드 정의
  static int calFun(int arg) {
    return arg * 10;
  }

  // 객체 멤버인 printData() 메서드 정의
  printData() => print('data1: ${this.data1}, data2: ${this.data2}');
}
/*********************[]*********************/

/*********************[]*********************/

/*********************[]*********************/

void main(List<String> args) {
  print('*********************[] 실습 코드 출력*********************');
  User user = new User('seonjae', 29);
  user.sayHello();
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  List<int> list = [100, 200];
  // 클래스 객체 생성과 동시에 생성자 호출
  MyClass my_class = new MyClass(list);

  // 객체 멤버인 printData() 메서드 호출
  my_class.printData();
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  print('\n');

  print('*********************[] 실습 코드 출력*********************');
  print('\n');
}