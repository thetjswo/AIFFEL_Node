/*********************[4-5-1]널 허용과 널 불허*********************/
// 널 불허 변수
int data1 = 1;
// 널 허용 변수
int? data2 = null;

class User {}
// 널 불허 클래스 객체
User user1 = User();
//널 허용 클래스 객체
User? user2 = null;


/*********************[4-5-2]널 불허 변수의 초기화*********************/
// int type
var a1 = 10;
// dynamic type
var a2 = null;
// dynamic type
var a3;

void test_func() {
  // 이미 변수의 데이터 형식이 정수형으로 결정됐기 때문에 null을 대입하는 것은 불가능하다.
  a1 = 20;
  print('a1: $a1');
  print('*'*50);

  // 변수를 선언할 때, 초기화값을 null로 지정하여 변수의 데이터 형식이 dynamic 형식으로 결정됐기 때문에,
  // 변수에 모든 자료형 및 null을 대입할 수 있다.
  a2 = 20;
  print('a2: $a2');
  a2 = 'test';
  print('a2: $a2');
  a2 = null;
  print('a2: $a2');
  print('*'*50);

  // 변수를 선언할 때, 초기화값을 null로 지정하여 변수의 데이터 형식이 dynamic 형식으로 결정됐기 때문에,
  // 변수에 모든 자료형 및 null을 대입할 수 있다.
  a3 = 20;
  print('a3: $a3');
  a3 = 'test';
  print('a3: $a3');
  a3 = null;
  print('a3: $a3');
  print('*'*50);
}


/*********************[4-5-3]var 타입의 널 안정성*********************/
int i1 = 10;
int? i2;

var v1 = i1;
var v2 = i2;

void test_func2() {
  // v1 변수는 널 불허 정수형 변수인 i1의 값을 대입하여 int로 결정이 됐으므로, 정수 외의 값을 대입할 수 없다.
  v1 = 20;

  //v2 변수는 널 허용 정수형 변수인 i2의 값을 대입하여 int?로 결정이 됐으므로, null 포함 정수 값을 대입할 수 있다.
  v2 = 20;
  v2 = null;

  print('v1: $v1, v2: $v2');
  print('*'*50);
}


/*********************[4-5-4]dynamic 타입의 널 안정성*********************/
// dynamic 타입은 모든 자료형을 대입할 수 있고, 그 안에는 nullable도 포함되어 있기 때문에
// dynamic 타입에 ?를 붙이는 것은 의미가 없다.
dynamic d1 = 10;
dynamic d2;
dynamic? d3;

void test_func3() {
  d1 = null;
  d2 = null;
  d3 = null;

  print('d1: $d1, d2: $d2, d3: $d3');
  print('*'*50);
}

main() {

  print('*********************[4-5-1] 실습 코드 출력*********************');
  /*
  * null 불허 객체를 초기화하지 않거나, null값을 대입하지만 않으면 된다.
  * 보통 변수의 값이 가변적이고, 특정한 초깃값을 지정하기 번거로울 때 null 허용 변수로 선언을 많이 하지만,
  * Tip. null 허용 변수의 경우, 객체의 인스턴스 등을 사용할 때마다 해당 값의 null 여부를 판단하는
  * null check 로직을 하나 하나 만들어줘야 하기 때문에 무분별한 사용은 하지 않는 것이 좋다.
  */
  print(data1);
  print(data2);
  print(user1);
  print(user2);


  // 이와 같이 결과 값이 어떤 값인지 모르는 상황에서 변수를 정의하려 할 때 널 허용 변수로 선언할 수 있다.
  int f_data = 1;
  int s_data = 0;
  int? res = null;

  int sum(a, b) {
    int data_a = a * 10;
    int data_b = b + 10;

    return data_a + data_b;
  }

  res = sum(f_data, s_data);

  //null check
  if (res != null) print('res: $res');
  print('\n');


  print('*********************[4-5-2] 실습 코드 출력*********************');
  test_func();
  print('\n');


  print('*********************[4-5-3] 실습 코드 출력*********************');
  test_func2();
  print('\n');


  print('*********************[4-5-4] 실습 코드 출력*********************');
  test_func3();
  print('\n');


  /*********************[4-5-5]널 안정성과 형변환*********************/
  int ic1 = 20;
  int? ic2 = 10;

  print('*********************[4-5-5] 실습 코드 출력*********************');
  // Nullable은 NonNull의 상위 타입이기 때문에 NonNull 변수를 Nullable 변수에 대입할 수 있다.
  ic2 = ic1;
  print('res1: $ic2');
  ic2 = null;
  print('res2: $ic2');

  ic2 = 20;
  // 만약 Nullable 변수의 값을 NonNull 변수에 대입을 하고 싶다면, as 연산자를 사용하여 명시적으로 형변환을 시켜줘야 한다.
  ic1 = ic2 as int;
  print('res3: $ic1');
  print('\n');


  /*********************[4-5-6]초기화를 미루는 late 연산자*********************/
  int li_a = 10;
  int li_b = 20;
  // late 연산자는 초기화를 미루고 싶을 때 사용하는 연산자이다. null을 허용한다는 의미는 아니지만, 초깃값을 정하기 애매할 때 사용하기 좋다.
  // insight. 그럼 test_func1과 같이 함수의 return값을 대입할 변수를 선언할 때 ?가 아닌 late를 사용해서 Null Check을 덜 고려하는 방향으로 코드를 구성하는 것이 좋을 것 같다.
  late int li_res;

  int test_func4(a, b){
    return a+b;
  }

  li_res = test_func4(li_a, li_b);
  print('*********************[4-5-6] 실습 코드 출력*********************');
  print('li_res: $li_res');
}