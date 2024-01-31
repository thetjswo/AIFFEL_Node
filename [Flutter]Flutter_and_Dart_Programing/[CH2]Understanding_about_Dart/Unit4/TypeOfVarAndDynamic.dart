main() {
  // var 타입은 어떠한 변수도 될 수 있지만, 한 번 초기화가 되면 그 데이터의 자료형으로 고정이 된다.
  var data1;
  data1 = 10;
  // data1 = 'test';
  // data1 = 10.0;
  print('1. $data1(${data1.runtimeType})');

  // dynamic 타입은 어떠한 변수도 될 수 있으며, 초기화 이후에도 자료형을 계속 변경할 수 있다.
  dynamic data2;
  data2 = 10;
  print('2. $data2(${data2.runtimeType})');
  data2 = 10.0;
  print('3. $data2(${data2.runtimeType})');
  data2 = '10';
  print('4. $data2(${data2.runtimeType})');
  data2 = false;
  print('5. $data2(${data2.runtimeType})');
}