/*********************[7-2-1]추상 클래스 알아보기*********************/
// 추상 클래스 선언 - 추상클래스는 객체를 생성할 수 없다.
abstract class User {
  // 추상클래스의 멤버는 내부에 로직을 구성할 수 없다.
  void some();
}

class Customer extends User {
  // 이렇게 @override 어노테이션을 붙여서 추상 클래스의 멤버를 상속 받는다는 것을 명시한다.
  @override
  void some() {}
}

/*********************[7-2-2]인터페이스 알아보기*********************/
class User1 {
  int no;
  String name;

  // 부모 클래스 생성자
  User1(this.no, this.name);
  String greet(String who) => 'Hello, $who. I am $name. no is $no';
}

class MySubClass extends User1 {
  // 부모 클래스 생성자 상속
  MySubClass(super.no, super.name);
}

//인터페이스 사용
class MyClass implements User1 {
  // 인터페이스에 선언된 모든 멤버를 재정의해야 한다.
  int no = 10;
  String name = 'Lee';

  //  인터페이스의 메서드 멤버 상속
  @override
  String greet(String who) {
    return 'hello';
  }
}


void main(List<String> args) {
  print('*********************[7-2-1] 실습 코드 출력*********************');
  print('\n');

  print('*********************[7-2-2] 실습 코드 출력*********************');
  // 자식 클래스 객체 생성 - 부모 클래스의 생성자 호출(부모 클래스 멤버 재정의)
  MySubClass msc = new MySubClass(11, 'Park');
  // 부모 클래스의 멤버 호출
  print(msc.greet('park'));

  // 구현 클래스 객체 생성
  MyClass mc = new MyClass();
  // 오버라이딩된 인터페이스 클래스의 멤버 호출 - 반환 값을 재정의 했기 때문에 'heelo'가 반환된다.
  print("${mc.greet('lee')}");

}