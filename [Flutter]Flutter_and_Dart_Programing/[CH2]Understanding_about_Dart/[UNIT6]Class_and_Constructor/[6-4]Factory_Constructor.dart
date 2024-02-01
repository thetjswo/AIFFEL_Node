/*********************[6-4-1]캐시 알고리즘 구현*********************/
class Image {
  // 객체 멤버
  late String url;
  // 클래스 멤버
  static Map<String, Image> _cache = <String, Image>{};
  // 명명된 생성자 정의 - 매개변수는 객체 멤버인 url
  Image._instance(this.url);
  // 팩토리 생성자 정의 = 매개변수는 url
  factory Image(String url) {
    if (_cache[url] == null) {          // 전달받은 식별자가 캐시가 없으면,
      var obj = Image._instance(url);   // 해당 식별자로 객체를 새로 생성하고
      _cache[url] = obj;                // 클래스 멤버 _cache에 객체 추가
    }

    return _cache[url]!;                // Null 여부를 판단해서 식별자에 해당하는 객체를 반환
  }
}

void main(List<String> args) {
  print('*********************[] 실습 코드 출력*********************');
  // 캐시 생성
  var image1 = Image('a.jpg');
  // 캐시에 저장된 기존 객체 반환
  var image2 = Image('a.jpg');
  //캐시 생성
  var image3 = Image('b.jpg');

  print('image1 == image2 : ${image1 == image2}');
  print('image1 == image3 : ${image1 == image3}');
  print('\n');
}