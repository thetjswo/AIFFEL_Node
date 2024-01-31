/*********************[5-6-1]나누기 연산자*********************/
// '~/' 연산자를 사용하면 나눗셈 결과가 정수형으로 출력된다.
divide_to_integer(a, b) {
  int res = a ~/ b;
  print('int result: ${res}(${res.runtimeType})');
}
divide_to_float(a, b) {
  double res = a / b;
  print('float result: ${res}(${res.runtimeType})');
}

/*********************[5-6-2]타입 확인과 변환 - is, as*********************/
class User1 {
  void some() {
    print('User...some()...');
  }
}
/*********************[5-6-3]반복해서 접근하기*********************/
class User2 {
  String? name;
  int? age;

  some() {
    print('name: $name, age: $age');
  }
}


void main(List<String> args) {
  print('*********************[5-6-1] 실습 코드 출력*********************');
  int d_data1 = 7;
  int d_data2 = 2;
  // 소수점은 버린다.
  divide_to_integer(d_data1, d_data2);
  divide_to_float(d_data1, d_data2);
  print('\n');

  print('*********************[5-6-2] 실습 코드 출력*********************');
  Object obj1 = User1();

  // 조건이 true일 경우
  if (obj1 is User1) {
    obj1.some();
  }

  Object obj2 = User1();
  // 명시적 형변환
  (obj2 as User1).some();
  print('\n');

  print('*********************[5-6-3] 실습 코드 출력*********************');
  /* 이러한 방식으로 User 객체의 멤버에 접근하면 번거롭고 귀찮다.
   * var user = User2();
   * user.name = 'maiingan';
   * user.age = 29;
   * user.some();
   * print('\n');
   * 그렇게 때문에 ..연산자를 사용하여 객체의 멤버에 접근한다. (Nullable 객체에서는 ?.. 연산자를 사용한다.)
   */
  User2()
    ?..name = 'maiingan'
    ..age = 29
    ..some();
}