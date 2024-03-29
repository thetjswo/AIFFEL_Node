/*
옵셔널 위치 매개변수 선언 규칙
* 매개변수들을 []로 묶는다.
* 함수의 마지막 매개변수에만 선언할 수 있다.
* 매개변수에 기본 인자를 설정할 수 있다.
*/

void some(int data1, [String data2 = 'default', bool? data3]) => print('data1: $data1, data2: $data3, data3: $data3');

main() {
  /*
  옵셔널 위치 매개변수 호출 규칙
  * 매개변수 이름은 생략한다.
  * 매개변수가 선언된 순서에 따라 값이 할당된다.
  */

  // soem(); -> 기본 매개변수는 반드시 전달이 되어야 한다.
  some(10); // 옵셔널 위치 매개변수는 생략이 가능하다.
  // some(10, data2: 'Hello, World!', data3: true); -> 옵셔널 위치 매개변수를 호출할 때에는 매개변수의 이름을 명시하지 않는다.
  some(10, 'Hello, World!', true);
  // some(10, true, 'Hello, World!'); -> 매개변수의 이름을 명시하지 않기 때문에 매개변수가 선언된 위치를 동일하게 맞춰줘야 한다.
  some(10, 'Hello, World!'); // 옵셔널 위치 매개변수의 일부를 생략할 수 있다.
  // some(10, true); -> 위치 정보가 중요하기 때문에 앞 선 위치의 옵셔널 위치 매개변수를 생략할 수 없다.

}