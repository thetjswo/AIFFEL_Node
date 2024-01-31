/*********************[5-4-1]함수 타입 인수*********************/
// 함수를 대입할 수 있는 객체를 함수 타입이라고 하며, 'Function'으로 선언한다.
int sum(int num) {                                  //4. sum()함수 진입 - 매개변수는 20
  return num + 10;                                  //5. 연산결과 30 반환
}

int mul(int num) {                                  //9. mul()함수 진입 - 매개변수는 20
  return num * 10;                                  //10. 연산 결과 200 반환
}

Function calculator(Function argFunc) {             //2. calulator()함수 진입 - 매개변수는 sum()함수
  print('argFunc: ${argFunc(20)}');                 //3. argFunc(20) = sum(20) - sum()함수 호출, 인수는 20
                                                    //5. 'argFunc: 30' 출력

  return mul;                                       //6. mul()함수 반환
}

some(int f(int a)) {                                //ii. some()함수 진입 - 매개변수는 정수형 익명함수
  return f(30);                                            //iii. 익명함수 호출 - 인수는 30
}

/*********************[5-4-2]익명 함수*********************/
func1() {return print('func1 결과 출력: ${10}');}
// '(arg) {return print(10);};' 이 코드는 func1과 같은 동작을 하는 함수지만, 함수의 이름이 정해져있지 않아 익명함수라고 부른다.
Function func2 = () {return print('func2 결과 출력: ${10}');};


void main(List<String> args) { // void, List<String> args는 main()함수의 default 설정 같은 것이다.
  print('*********************[5-4-1] 실습 코드 출력*********************');
  var res1 = calculator(sum);                       //1. calculator()함수 호출 - 인수는 sum()함수
                                                    //7. res = mul
  print('result: ${res1(20)}');                     //8. res(20) = mul(20) - mul()함수 호출, 인수는 20
                                                    //11. 'result: 200' 출력

  // func(int a) {
  //   return a + 20;
  // }
  int? res2 = some((int a) {                        //i. some()함수 호출 - 인수는 매개변수를 정수형 변수 a를 가진 익명함수
                                                    //iv. 익명함수 진입 - 매개변수는 30
    return a + 20;                                  //v. 연산결과 50 반환
  });
  print('result: $res2');
  print('\n');

  print('*********************[5-4-2] 실습 코드 출력*********************');
  func1();
  func2();

  print('\n');
}