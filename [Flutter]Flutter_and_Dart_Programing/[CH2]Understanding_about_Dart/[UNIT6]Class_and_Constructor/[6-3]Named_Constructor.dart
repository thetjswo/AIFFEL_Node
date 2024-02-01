/*********************[6-3-1]this()로 다른 생성자 호출하기*********************/
class MyClass {
  late int data1;
  late int data2;

  MyClass(list) {
    //print는 초기화 목록에 포함될 수 없다.
    print('MyClass() call....');
    this.data1 = list[0];
    this.data2 = list[1];
  }
  // 명명된 생성자를 사용하여 클래스의 생성자 호출
  // {}가 아닌 초기화 목록을 사용해야 하며, this()호출문 외의 다른 구문을 사용할 수 없다.
  MyClass.first(List<int> arg) : this(arg);
  // 명명된 생성자 호출
  MyClass.second(List<int> arg) : this.first(arg);

  printData() => print('data1: ${this.data1}, data2: ${this.data2}');
}

void main(List<String> args) {
  print('*********************[6-3-1] 실습 코드 출력*********************');
  List<int> list = [100, 200];
  // 클래스 객체를 생성하고 명명된 생성자 호출
  MyClass my_class = new MyClass.second(list);

  my_class.printData();
  print('\n');
}