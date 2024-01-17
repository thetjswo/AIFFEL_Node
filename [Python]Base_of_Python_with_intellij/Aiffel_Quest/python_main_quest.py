from random import *
import datetime

class Account:
    # 생성된 계좌 개수
    acc_cnt = 0

    # 은행이름 SC은행으로 고정
    bank = 'SC은행'
    # 예금주, 초기 잔액 입력
    def __init__(self, name, bal):
        # 예금주 속성
        self.name = name
        # 잔액 속성
        self.bal = bal

        # 계좌번호 랜덤 개설
        self.acc_num = ''

        rd = [str(randint(0, 10)) for i in range(11)]
        rd.insert(3, '-')
        rd.insert(6, '-')

        for i in rd:
            self.acc_num += i

        self.dps_cnt = 0

        # 입금 내역 리스트
        self.dps_list = []
        # 출금 내역 리스트
        self.wd_list = []

        #객체 생성 시, 계좌 개수 +1
        Account.acc_cnt += 1

    # 생성된 계좌 개수 출력 메서드
    def get_account_num(self):
        return print(f'생성된 계좌의 개수는 {Account.acc_cnt}개 입니다.')

    # 입금 메서드 정의
    def deposit(self):
        # 입금 시간 구하기
        d = datetime.datetime.now()

        self.dps_money = 0

        try:
            while self.dps_money == 0:
                self.dps_money = int(input('입금할 금액을 입력하세요: '))

                if self.dps_money == 0:
                    print('계좌 입금은 1원 이상부터 가능합니다.')
                else:
                    self.bal += self.dps_money
                    self.dps_list.append(f'{d.year}-{d.month}-{d.day} {d.hour}:{d.minute}:{d.second}, {format(self.dps_money, ",")}원 예금 입금')
                    # 입금 횟수 카운트
                    self.dps_cnt += 1

            # 입금 횟수가 5의 배수가 되면 이자 추가
            if self.dps_cnt % 5 == 0:
                # 이자 = 원금의 1%
                interest = self.bal * 0.01
                self.bal += interest
                self.dps_list.append(
                    f'{d.year}-{d.month}-{d.day} {d.hour}:{d.minute}:{d.second}, {format(self.dps_money, ",")}원 이자 입금')

            print(f'''처리가 완료되었습니다.
{self.name}님의 잔고는 {format(self.bal, ',')}원 입니다.''')

            return True
        except:
            print('입금 금액 입력은 숫자만 가능합니다.')

            return False


    # 출금 메서드 정의
    def withdraw(self):
        # 출금 시간 구하기
        d = datetime.datetime.now()

        self.wd_money = self.bal + 1

        try:
            while self.wd_money > self.bal:
                self.wd_money = int(input('출금할 금액을 입력하세요: '))

                if self.wd_money > self.bal:
                    print(f'''계좌 출금은 잔액을 상회할 수 없습니다.
현재 {self.name}님의 잔고는 {format(self.bal, ',')}원 입니다.''')
                else:
                    self.bal -= self.wd_money
                    self.wd_list.append(
                        f'{d.year}-{d.month}-{d.day} {d.hour}:{d.minute}:{d.second}, {format(self.wd_money, ",")}원 예금 출금')

            print(f'''처리가 완료되었습니다.
{self.name}님의 잔고는 {format(self.bal, ',')}원 입니다.''')

            return True
        except:
            print('입금 금액 입력은 숫자만 가능합니다.')

            return False


    # 계좌 정보 확인 메서드 정의
    def display_info(self):
        return print(f"개설된 계좌 정보 : (은행이름: {Account.bank}, 예금주: {self.name}), 계좌번호: {self.acc_num}, 잔고: {format(self.bal, ',')}")

    # 예금 입금 이력 확인 메서드
    def deposit_history(self):
        print(f'***{self.name}님의 예금 입금 이력 리스트를 출력합니다.***')
        for i in self.dps_list:
            print(i)

    # 예금 출금 이력 확인 메서드
    def withdraw_history(self):
        print(f'***{self.name}님의 예금 출금 이력 리스트를 출력합니다.***')
        for i in self.wd_list:
            print(i)


client_a = Account('이선재', 0)
client_b = Account('이창재', 10000000)
client_c = Account('이봉재', 20000)
client_d = Account('이현재', 5000)

# 고객 리스트 생성
client = [client_a, client_b, client_c, client_d]

# SC은행에 개설된 총 계좌 개수 확인
client_a.get_account_num()

# 계좌 입금
def deposit(client):
    dps_success = False
    while dps_success == False:
        if client.deposit():
            dps_success = True

            break



# 계좌 출금
def withdraw(client):
    wd_success = False
    while wd_success == False:
        if client.withdraw():
            wd_success = True

            break


# 잔고 100만워 이상 고객 탐색
def vip(client):
    print('계좌 잔고가 100만원 이상인 고객 정보를 탐색합니다.')
    print('*'*70)
    for i in client:
        if i.bal > 1000000:
            # 계좌 정보 확인
            i.display_info()

    print('*' * 70)


# 이자 계산을 위한 입금 6회
for i in range(6):
    deposit(client[0])
print()

# 예금 출금 함수 호출
withdraw(client[0])
print()

# 예금 입금 리스트 출력
for i in client:
    i.deposit_history()
    print()
print()

# 예금 출금 리스트 출력
for i in client:
    i.withdraw_history()
    print()
print()

# VIP 고객 정보 출력 함수 호출
vip(client)