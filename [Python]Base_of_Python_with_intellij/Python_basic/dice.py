# 짱구, 철수, 유리는 주사위 게임을 한다.
# 주사위를 굴려 나오는 숫자만큼 앞으로 전진하며 38번째 자리에 먼저 도착하는 사람이 승자이다.
# 각 플레이어는 각자 사용할 말의 색을 입력해야한다.
# 5의 배수 자리에 도착하면 앞으로 2칸 더 전진할 수 있으며, 8의 배수 자리에 도착하면 뒤로 2칸 후진해야 한다.
# 가장 먼저 38번째 자리에 도착한 사람의 이름을 출력 하여라.
# 단, 이번 주에 배운 예외처리와 모듈을 활용하여 코드를 작성해야 한다.
from random import *
from time import *

name = {'짱구':'','철수':'','유리':''}

def choose_holse(player):
    for i in player:
        player[i] = [input(f'{i}가 사용할 말의 색을 정하시오: '),0]
        if player[i][0].isdigit() == False:
            print(f'{i}가 사용할 말의 색은 \'{player[i][0]}\' 입니다.')
        else:
            print('사용할 말의 색을 문자로 입력하시오.')
            choose_holse(name)

    return player



player = choose_holse(name) #{'짱구':['빨강',0], ...}

status = True

while status == True:
    for i in player:
        dice = randint(1, 6)
        print("나온 주사위 숫자: ", dice)

        player[i][1] += dice
        print(f'{player[i][0]} 말은 {player[i][1]}번째 자리에 있습니다.')

        if player[i][1] != 0 and player[i][1] % 5 == 0:
            player[i][1] += 2
            sleep(1)
            print(f'{player[i][0]} 말이 {player[i][1]}번째 자리로 전진했습니다.')
        elif player[i][1] != 0 and player[i][1] % 8 == 0:
            player[i][1] -= 2
            sleep(1)
            print(f'{player[i][0]} 말이 {player[i][1]}번째 자리로 후진했습니다.')

        if player[i][1] >= 38:
            status = False
            print(f'{player[i][0]} 말을 사용한 {i}가 제일 먼저 38번째 자리에 먼저 도착을 했습니다.')
            break

        print('='*25)
        sleep(2)