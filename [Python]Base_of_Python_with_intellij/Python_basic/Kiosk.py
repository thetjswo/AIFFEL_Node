# 문제 3-3. 클래스 업데이트
# 앞에서 구현했던 메서드들을 Kiosk 클래스에 추가합니다. 직접 코드를 작성해 보세요!

class Kiosk:
    def __init__(self):
        self.menu = ['americano', 'capuchino', 'cold-brew', 'orange juice', 'green tea', 'beer', 'soju']
        self.price = [4500, 3500, 5000, 4000, 3000, 5000, 5000]

    # 메뉴 출력 메서드
    def menu_print(self):
        for i in range(len(self.menu)):
            print(i + 1, self.menu[i], ' : ', self.price[i], '원')

    # 주문 메서드
    def menu_select(self):
        # 빈 주문 리스트 생성
        self.order_menu = []
        self.order_price = []

        n = 0
        # 정확한 주문 번호를 선택할 때까지 반복
        while n < 1 or n > len(self.menu):
            # 입력받은 문자열을 int로 전환
            n = int(input('음료 번호를 선택해 주세요: '))

            # 입력 받은 번호가 범위 내에 있는지 확인
            if n >= 1 and n <= len(self.menu):
                # 가격 리스트에 주문 가격 추가
                self.order_price.append(self.price[n - 1])
                # 총 주문 가격 update
                self.price_sum = self.price[n - 1]
            else:
                print('없는 메뉴입니다. 다시 선택해주세요:')

        # 음료 온도 확인 로직 구현
        t = 0
        while t != 1 and t != 2:
            t = int(input('HOT 음료는 1번을, ICE 음료는 2번을 선택해 주세요:'))

            if t == 1:
                self.temp = 'HOT'
            elif t == 2:
                self.temp = 'ICE'
            else:
                print('1과 2 중 하나를 선택해 주세요:')

        # 주문 메뉴 리스트에 추가
        self.order_menu.append(self.temp + ' ' + self.menu[n - 1])

        print('주문 음료', self.temp, self.menu[n - 1], ' : ', self.price[n - 1], '원')

        # 추가 주문/결제 확인 로직 구현
        while n != 0:
            print('\n')
            n = int(input('추가 주문을 원하시면 음료 번호를, 지불은 0을 선택해 주세요:'))

            if n > 0 and n <= len(self.menu) + 1:
                # 추가 주문 메뉴 가격 리스트에 추가
                self.order_price.append(self.price[n - 1])
                # 주문 총액 계산
                self.price_sum += self.price[n - 1]

                # 추가 주문 음료 온도 선택
                t = 0
                while t != 1 and t != 2:
                    t = int(input('추가 주문할 음료의 온도를 선택해 주세요(HOT은 1,ICE는 2): '))
                    if t == 1:
                        self.temp = 'HOT'
                    elif t == 2:
                        self.temp = 'ICE'
                    else:
                        print('1과 2 중 하나를 선택해 주세요:\n')

                # 추가 음료를 주문 리스트에 추가
                self.order_menu.append(self.temp + ' ' + self.menu[n - 1])
                print('추가 주문 음료', self.temp, self.menu[n - 1], ' : ', self.price[n - 1], '원')
            elif n == 0:
                print('주문이 완료되었습니다.\n 주문 내역을 확인해 주세요.')
                print('메뉴', self.order_menu, ' - 가격', self.order_price)
            else:
                print('0 또는 음료 번호를 입력하여 주세요:\n')

    # 지불
    def pay(self):
        way = 0
        while way != 1 and way != 2:
            way = int(input('결제 방식을 선택해 주세요\n현금 결제는 1번을, 카드 결제는 2번을 선택해 주세요: '))
            if way == 1:
                print('직원을 호출하겠습니다.')
            elif way == 2:
                print('IC 칩의 방향에 맞게 카드를 꽂아 주세요.')
            else:
                print('결제를 다시 시도해 주세요.')

    # 주문서 출력
    def table(self):
        print('⟝' + '-' * 30 + '⟞')
        for i in range(5):
            print('|' + ' ' * 31 + '|')

        price = 0
        # 주문 상품명 : 해당 금액
        for i in range(len(self.order_menu)):
            print(self.order_menu[i], ' : ', self.order_price[i], '\n')
            price += self.order_price[i]

        print('합계 금액 :', price)

        # 외곽
        for i in range(5):
            print('|' + ' ' * 31 + '|')
        print('⟝' + '-' * 30 + '⟞')