/*********************[7-3-1/2]믹스인 알아보기/사용하기*********************/
// 믹스인 정의 -> 믹스인은 클래스가 아니기 때문에 생성자를 선언할 수도, 객체를 생성할 수도 없다.
mixin MyMixin {
  int mixin_data = 10;
  // 생성자와 객체만 생성할 수 없을 뿐, 나머지 멤버는 모두 선언할 수 있다.
  static int mixin_data2 = 20;

  void mixinFunc() => print('MyMixin... myFunc1()...');
}

// 부모 클래스 정의
class MySuper {
  int super_data = 20;

  void superFunc() => print('MySuper... superFunc()...');
}

// 자식 클래스 정의 - 다트는 다중 상속이 안되기 때문에 공용으로 사용할 클래스 혹은, 자주 쓰이는 클래스를
// 믹스인으로 구성하여 with 구문과 함께 사용한다.
class MyClass extends MySuper with MyMixin {
  void sayHello() {
    // 부모 클래스와 믹스인의 멤버 변수 호출
    print('class data: ${super_data}, mixin data: ${mixin_data}');
    // 믹스인의 멤버 메서드 호출
    mixinFunc();
    // 부모 클래스의 멤버 메서드 호출
    superFunc();
  }
}

/*********************[7-3-3]믹스인 사용 제약*********************/
// on 구문을 사용하여 MySuper1 클래스만 사용할 수 있도록 제약을 걸 수 있다.
mixin MyMixin1 on MySuper1 {

}
// MySuper1 클래스만이 MyMixin과 믹스인 할 수 있다.
class MySuper1 {}

// MyClass1은 MySuper1을 상속했기 때문에 MyMixin1을 믹스인 할 수 있다.
//Insight. MyClass1(MySuper1(MyMixin1)) 이런 포함관계를 가지는 것 같다.
class MyClass1 extends MySuper1 with MyMixin1 {}
// MySuper1을 상속하는 모든 클래스는 MyMixin1을 믹스인 할 수 있다.
class MyClass2 extends MySuper1 with MyMixin1 {}
class MyClass3 extends MySuper1 with MyMixin1 {}
class MyClass4 extends MySuper1 with MyMixin1 {}

void main(List<String> args) {
  print('*********************[7-3-1/2] 실습 코드 출력*********************');
  // 자식 클래스 객체 생성
  var obj = MyClass();
  // 자식 클래스의 객체 멤버 메서드 호출
  obj.sayHello();
  print('\n');

}