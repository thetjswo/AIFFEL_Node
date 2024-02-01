/*********************[7-1-1]상송과 오버라이딩*********************/
/***일반적인 오버라이딩***/
// 부모 클래스
class SuperClass {
  int myData = 10;

  void myFunc() => print('Super..myFunc()...');
}

// 자식 클래스 - SuperClass 오버라이딩
class SubClass extends SuperClass {

}

/***오버라이딩 후, 부모 클래스의 멤버 재정의***/
// 부모 클래스
class SuperClass1 {
  int myData = 10;

  void myFunc() => print('Super..myFunc()...');
}

// 자식 클래스 - SuperClass1 오버라이딩
class SubClass1 extends SuperClass1 {
  // 부모 클래스의 멤버 재정의
  int myData = 20;

  // 부모 클래스의 멤버 메서드 재정의
  void myFunc() => print('Sub..myFunc()...');
}

/***오버라이딩 후, super를 사용하여 부모 클래스의 멤버 그대로 사용***/
// 부모 클래스
class SuperClass2 {
  int myData = 10;

  void myFunc() => print('Super..myFunc()...');
}

// 자식 클래스 - SuperClass2 오버라이딩
class SubClass2 extends SuperClass2 {
  // 부모 클래스의 멤버 재정의
  int myData = 20;

  // 부모 클래스의 멤버 메서드 재정의
  void myFunc() {
    //부모 클래스의 메서드 그대로 사용
    super.myFunc();
    // 재정의 항목 추가
    print('Sub... myFunc()..myData: $myData, super.myData: ${super.myData}');
  }
}
/*********************[7-1-2] 부모 생성자 호출하기*********************/
class SuperClass3 {
  late int myData;

  // 부모 클래스의 생성자
  SuperClass3(arg) {print('Parents Constructor....');}
  SuperClass3.first() {print('Parents Constructor....1');}
}

class SubClass3 extends SuperClass3 {
  // 자식 클래스의 생성자로 부모 클래스의 생성자 호출 - 부모 클래스의 생성자 종류 및 매개변수의 타입과 개수를 맞춰줘야 한다.
  SubClass3() : super(10) {}
  SubClass3.first() : super.first() {}
}

/*********************[7-1-3]부모 클래스의 초기화*********************/
/***부모 클래스의 멤버 변수 초기화1***/
class SuperClass4 {
  late String name;
  late int age;

  // 부모 클래스의 생성자
  SuperClass4(name, age) : this.name = name, this.age = age {}

  printData() => print('name: ${this.name}, age: ${this.age}');
}

class SubClass4 extends SuperClass4 {
  // 부모 클래스의 멤버 변수 초기화
  SubClass4(String name, int age) : super(name, age) {}
}

/***부모 클래스의 멤버 변수 초기화2***/
class SuperClass5 {
  late String name;
  late int age;

  // 부모 클래스의 생성자
  SuperClass5(name, age) : this.name = name, this.age = age {}

  printData() => print('name: ${this.name}, age: ${this.age}');
}

class SubClass5 extends SuperClass5 {
  // 부모 클래스의 멤버 변수 초기화
  SubClass5(super.name, super.age);
}


void main(List<String> args) {
  print('*********************[7-1-1] 실습 코드 출력*********************');
  // 자식 클래스 객체 생성
  var obj = new SubClass();
  var obj1 = new SubClass1();
  var obj2 = new SubClass2();

  //부모 클래스의 메서드 호출
  obj.myFunc();
  //부모 클래스의 멤버 호출
  print('obj.data: ${obj.myData}');

  //자식 클래스의 메서드 호출
  obj1.myFunc();
  //자식 클래스의 멤버 호출
  print('obj1.data: ${obj1.myData}');

  //자식 클래스의 메서드 호출 - 부모 클래스의 myFunc() 메서드의 로직이 실행된 후, 자식클래스에서 추가한 로직이 실행된다.
  obj2.myFunc();
  print('\n');

  print('*********************[7-1-2] 실습 코드 출력*********************');
  // 자식 클래스의 객체 생성 - 부모 클래스의 생성자 호출
  new SubClass3();
  // 자식 클래스의 객체 생성 - 부모 클래스의 명명된 생성자 호출
  new SubClass3.first();
  print('\n');

  print('*********************[7-1-3] 실습 코드 출력*********************');
  List list = ['seonjae', 29];
  // 자식 클래스 객체 생성 -> 부모 클래스 생성자 호출 -> 부모 클래스 멤버 변수 초기화
  var obj3 = new SubClass4(list[0], list[1]);
  var obj4 = new SubClass5(list[0], list[1]);

  obj3.printData();
  obj4.printData();
  print('\n');
}