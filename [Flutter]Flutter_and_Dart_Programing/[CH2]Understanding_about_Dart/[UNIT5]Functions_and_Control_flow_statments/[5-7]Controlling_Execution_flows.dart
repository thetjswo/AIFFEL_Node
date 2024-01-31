/*********************[5-7-1]for 반복문에서 in 연산자*********************/
loof1(list) {
  // 시작 지점: 0, 끝 지점: list의 길이, i의 증가 크기: 1
  // i가 1의 보폭으로 0부터 list의 길이까지 걸어가면서 내부 로직을 구동시킨다.
  for(int i=0 ; i < list.length ; i++) print(list[i]);
}

loof2(list) {
  // 변수 x에 list의 요소를 하나씩 대입
  for(var x in list) print(x);
}

/*********************[5-7-2]switch~case 선택문*********************/
switch_case(arg) {
  switch(arg) {
    case 'A':
      print('A');
      // 케이스 내부의 로직이 종료되었을 때의 동작을 결정해줘야 한다.
      break;
    case 'B':
      print('B');
      break;
  }
}

/*********************[5-7-3]예외 던지기와 예외 처리*********************/
/**예외를 발생시키는 throw문**/
// 예외 발생시키기
some1() => throw Exception('My Exception');
// 지정된 문자열로 예외 던지기
some2() => throw 'My Exception';
// 클래스 객체로 예외 던지기
class MyException {}
some3() => throw MyException();

/**try~on~finally 예외 처리**/
some4() => throw FormatException('My Exception');


void main(List<String> args) {
  print('*********************[5-7-1] 실습 코드 출력*********************');
  List<int> list = [10, 20, 30];
  loof1(list);
  loof2(list);
  print('\n');

  print('*********************[5-7-2] 실습 코드 출력*********************');
  String sample = 'A';
  switch_case(sample);
  print('\n');

  print('*********************[5-7-3] 실습 코드 출력*********************');
  // some1(); -> Exception: My Exception 예외 발생
  // some2(); -> My Exception 예외 발생
  // some3(); -> Instance of 'MyException' 예외 발생

  try {
    print('Step1....');
    some4();
    // 예외 발생으로 인해 실행되지 않음
    print('Step2....');
  }
  // 예외 객체 전달 받기
  on FormatException catch(e) {
    // 예외 처리
    print('Step3....$e'); // Step3....FormatException: My Exception 출력
  }
  on Exception catch(e) {
    // FormatException에서 예외를 처리했기 때문에 실행되지 않음
    print('Step4....$e');
  }
  finally {
    print('Step5....');
  }
  print('Step6....');
  print('\n');
}