# 정규식 사용을 위한 모듈 import
import re
# 빈도수를 구하기 위한 모듈 import
from collections import Counter

# 파일 가져오기
file = open('/Avengers.txt', 'r')
# 파일 읽기
text = file.read()
# 파일 한 줄 읽기
#text = file.readline()
# 파일 한 줄씩 리스트에 담기
#text = file.readlines()
# 파일 객체 삭제
file.close()
# text 내용 소문자로 변환하기
text = text.lower().replace("\'"," ")
# 특수문자 제거하기
new_text = re.sub(r"[^a-z\s]","", text)
# 공백을 구분자로 분리하여 리스트 생성
words = new_text.split(" ")
# 2-gram 구하기
max2gram = list(zip(words, words[1:]))
# 2-gram 빈도 수 구하기
ctn2gram = Counter(max2gram)
# 2-gram 빈도수 내림차순 정렬하기
desc2gram = ctn2gram.most_common()
print(desc2gram)