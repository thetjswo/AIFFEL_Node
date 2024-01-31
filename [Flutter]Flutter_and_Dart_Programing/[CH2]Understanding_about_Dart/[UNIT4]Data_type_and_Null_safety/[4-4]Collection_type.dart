/*
* Collection 타입이란 한 변수에 여러 데이터를 저장하는 방법으로 배열, 리스트, 집합, 맵 등이 있다. 여기서 배열과 리스트는 구분이 없이 사용이 가능하다.
*/
main() {
  /*********************[4-4-1]리스트 타입*********************/
  print('*********************[4-4-1] 실습 코드 출력*********************');
  // 파이썬의 리스트와 같다.
  // 각 요소의 타입을 지정하지 않았으므로, 아래의 리스트는 다이나믹 타입의 리스트이다.
  List list1 = [10, true, 'Hello'];
  list1[0] = 'Hello';
  list1[1] = 'World';
  list1[2] = '!';

  print('List1 : [${list1[0]}, ${list1[1]}, ${list1[2]}]');
  print('\n');

  /* 리스트를 생성할 때, 그에 속한 요소의 타입을 지정하려면 데이터 타입을 제너릭으로 지정하면 된다.
   * 제너릭으로 지정하게 되면 소스코드가 컴파일 될 때, 해당 리스트의 타입이 정해지게 된다.
   */
  List<bool> list2 = [true, true, true];
  list2[0] = false;

  print('List2 : [${list2[0]}, ${list2[1]}, ${list2[2]}]');

  //이미 선언된 리스트에 요소를 추가하거나 삭제할 수 있다.
  // 마지막 인덱스에 추가
  list2.add(false);
  print('list2 : $list2');
  // 첫 번째 인덱스부터 탐색 후, 한 개 제거
  list2.remove(false);
  print('list2 : $list2');
  //지정한 인덱스의 요소 제거
  list2.removeAt(0);
  print('list2 : $list2');
  print('\n');

  //리스트의 생성자로 해당 리스트의 크기를 지정할 수 있다.
  //크기가 5이고, 각 요소의 값이 0인 리스트 생성
  List<int> list3 = List<int>.filled(5, 0);
  print('list3 : $list3');
  // 각 요소의 값에 지정된 자료형을 대입할 수는 있지만, 크기가 정해져 있기 때문에 요소의 추가/삭제는 불가능하다.
  list3[0] = 1;
  print('list3 : $list3');
  print('\n');

  // 리스트의 크기가 가변적이게 될 상황이 예상된다면, filled()의 인자인 growable의 값을 true로 지정한다.
  var list4 = List<int>.filled(5, 0, growable:  true);
  print('list4 : $list4');
  list4.remove(0);
  print('list4 : $list4');
  list4.add(1);
  print('list4 : $list4');
  list4.add(1);
  print('list4 : $list4');
  print('\n');

  int func1(idx) {
    idx *= 10;

    return idx;
  }

  // filled()가 아닌 generate()를 사용하면 초깃값을 지정하는 두 번째 매개변수에 특정 연산이나 함수를 지정할 수 있다.
  var list5 = List<int>.generate(5, (index) => 10 + func1(index), growable: true);
  print('list5 : $list5');
  print('\n');
  print('\n');


  /*********************[4-4-2]집합 타입*********************/
  print('*********************[4-4-2] 실습 코드 출력*********************');
  // 집합 타입은 인덱스 값으로 요소에 접근하며, 리스트와는 달리 중복을 허용하지 않는다. (파이썬의 집합과 동일)
  Set<int> set1 = {10, 20, 10};
  print('set1 : $set1');
  set1.add(30);
  set1.add(40);
  print('set1 : $set1');
  print('\n');

  var set2 = Set();
  set2.add('a');
  set2.add('a');
  set2.add('b');
  set2.add(10);
  print('set2 : $set2');
  print('\n');
  print('\n');


  /*********************[4-4-3]맵 타입*********************/
  print('*********************[4-4-3] 실습 코드 출력*********************');
  // 맵은 여러 건의 데이터를 key와 value값의 형태로 저장하는 타입으로, 인덱스가 아닌 key값으로 value값을 조회한다. (파이썬의 딕셔너리와 동일)
  // Tip. 앱의 RestfulAPI를 활용한 비동기 통신에서 HTTP Protocal을 사용할 때, 데이터를 주로 Json의 형태로 송수신하게 된다.
  //      여기서 Json의 형식이 Map과 비슷하기 때문에 실제 앱 개발을 진행할 때 가장 많이 쓰게 되는 컬렉션 타입이다.
  Map<String, String> map1 = {'key1':'value1', 'key2':'value2', 'key3':'value3'};
  print("map1 : $map1");
  print("map1 : ${map1['key1']}");

  map1['key1'] = 'value10';
  print("map1 : $map1");
  print("map1 : ${map1['key1']}");
}