// _name 변수를 빈 문자열로 설정
String _name = '';

// getter 함수 정의
String get name {
  return _name.toUpperCase();
}

// setter 함수 정의
set name(value) {
  _name = value;
}

void main(List<String> args) {
  // setter 함수를 통해 _name 값 변경
  name = 'seonjae';
  // getter 함수를 통해 _name 값 출력
  print('My name is $name.');
}