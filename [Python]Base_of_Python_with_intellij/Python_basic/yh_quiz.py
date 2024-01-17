#오늘의 날짜를 입력하고(년, 월, 일), 오늘의 날짜와 일치할 경우 '오늘은 xxxx년 xx월 xx일이 맞습니다.'가 출력되게 만들고,
# 입력 날짜와 다를 경우 '달력을 확인 후 다시 입력해주세요.(3초 후 검색창이 다시 생성됩니다.)'라는 말이 문구가 출력되고,
# 3초 후 검색 창이 다시 뜨게 하시오..

from time import *

today = localtime()[:3] #(2024,11,14)

def check_date():
    input_date = input('오늘의 날짜를 입력하시오(년,월,일): ') #2024,11,14
    try:
        new_date = list(map(int, input_date.split(','))) #[2023,11,14]

        if today[0] == new_date[0] and today[1] == new_date[1] and today[2] == new_date[2]:
            print(f'오늘은 {today[0]}년 {today[1]}월 {today[2]}일이 맞습니다.')
        else:
            print('달력을 확인 후, 다시 입력해주세요.')
            sleep(3)
            check_date()
    except:
        print('구분자가 \',\'가 아닙니다.')
        sleep(3)
        check_date()


check_date()