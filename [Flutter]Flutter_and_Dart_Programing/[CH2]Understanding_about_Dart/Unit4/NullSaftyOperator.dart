int? some(arg) {
  if (arg == 10){
    return 0;
  } else {
    return null;
  }
}

main() {
  /*
  변수나 함수 뒤에 !를 붙이게 되면 dart가 자체적으로 Null Check을 하게 된다.
  insight. !를 붙여서 Null Check을 한 결과로 에러가 발생할 때에 대한 예외처리를 할 수 있다면 프로그램을 만들 때 굉장히 편리할 것 같다.
  */
  int nc1 = some(10)!;
  print('nc1: $nc1');

  // Null check operator used on a null value 에러 발생
  // int nc2 = some(20)!;
  // print('nc2: $nc2');

  String? str = '';
  // Nullable로 선언된 변수에 대해 특정 연산자를 사용할 때에는 '변수명.연산자', '변수명[]'이 아닌,
  // '변수명?.연산자', '변수명?[]'과 같이 해당 변수가 Nullable임을 명시해야 한다.
  bool res = str?.isEmpty as bool;
  print(res);

  // res와 res2의 결과가 정상적으로 출력되지만, 'Operand of null-aware operation '?.' has type 'String' which excludes null.'과 같은 경고문이 함께 출력된다.
  int? itg = 10;
  bool? res2 = itg?.isOdd;
  print(res2);

  // 리스트도 마찬가지로 변수를 나타내는 부분 뒤에 ?를 붙인다.
  List<int>? list = [10, 20, 30];
  print('List[0]: ${list?[0]}');

  list = null;
  print('List[0]: ${list?[0]}');

  int? data;
  // ??= 연산자는 대입할 값이 null이 아닌 경우에만 대입을 하고, null인 경우에는 대입을 하지 않는다.
  data ??= 10;
  print('data: $data');
  data ??= null;
  print('data: $data');

  //??= 예제
  int test1 = 10;
  int test2 = 9;

  test_func(a) {

    if (a.isEven == true) return 0;
    else return null;
  }

  int? result1;
  result1 ??= test_func(test1);
  print('result1: $result1');

  int? result2;
  result2 ??= test_func(test2);
  print('result: $result2');


  // ??연산자는 대입하고자 하는 Nullable 변수가 null이 아닐 때는 해당 값으로 대입하고, null일 경우에는 ?? 우측에 있는 값을 대입하게 하는 연산자이다.
  String? rp_data1 = 'hello';
  String? rp_res1 = rp_data1 ?? 'world';
  print('rp_res1: $rp_res1');

  String? rp_data2 = null;
  String? rp_res2 = rp_data2 ?? 'world';
  print('rp_res2: $rp_res2');
}