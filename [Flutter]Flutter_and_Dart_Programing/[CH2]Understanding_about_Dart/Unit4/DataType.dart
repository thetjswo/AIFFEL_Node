import 'dart:typed_data';

main() {
  //문자형 데이터
  String data1 = '0';
  //정수형 데이터
  int data2 = 10;
  //실수형 데이터
  double data3 = 10.0;
  //불리언 데이터
  bool data4 = true;

  //함수의 자료형은 return 값의 자료형과 일치해야 한다.
  bool func(data2, data3, data4) {
    //두 데이터가 같은지 확인하는 조건문
    if(data2 == data3){

      data4 = true;
    }else {

      data4 = false;
    }

    return data4;
  }

  //각각의 자료형 및 실행문 출력 예시
  print('String: $data1, Int: $data2, Double: $data3, Boolean: $data4, Sum: ${data2 + data3}, Func: ${func(data2, data3, data4)}');

  //문자형을 정수형으로 캐스팅
  int sti_data = int.parse(data1);
  //정수형을 실수형으로 캐스팅
  double d_data = data2.toDouble();
  //실수형을 정수형으로 캐스팅
  int i_data = data3.toInt();
  //정수형을 문자형으로 캐스팅
  String its_data = sti_data.toString();

  print('Type of data - sti_data: $sti_data(${sti_data.runtimeType}), d_data: $d_data(${d_data.runtimeType}), i_data: $i_data(${i_data.runtimeType}), its_data: $its_data(${its_data.runtimeType})');
}