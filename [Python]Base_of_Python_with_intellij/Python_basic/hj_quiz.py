#사용자가 반지름을 입력하게 하고 원의 넓이를 구해주는 계산기를 만드시오!
#소수점 2째자리까지 표시
#try, except, finally 활용할 것

from math import *

try:
    raidus = float(input('반지름을 입력하시오: '))

    width = round(raidus ** 2 * pi, 2)
    print(f'원의 넓이는 {width} 입니다.')
except:
    print('숫자를 입력하시오.')
finally:
    print('축하합니다!')