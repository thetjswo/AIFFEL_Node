# csv 모듈 import
import csv
import random
import pandas as pd
from IPython.display import display

#Aiffel 클래스 정의
class Aiffel:
    # 코어 과정 그루들의 순번 딕셔너리 입력 여부 플래그
    list_status = 0
    # 코어 과정 그루들의 순번 딕셔너리
    core_mem = {}
    # 학생 수(객체 수) 체크
    std_num_cnt = 0

    def __init__(self, nm, ent, th, crs):
        # 이름 속성
        self.nm = nm
        # 입학연도 속성
        self.ent = ent
        # 기수 속성
        self.th = th
        # 과정 속성
        self.crs = crs
        # 퀘스트 점수 총점
        self.psn_score = 0
        # 퀘스트 입력 총점
        self.psn_score_sum = 0
        # 퀘스트 페널티 총점
        self.psn_penalty_sum = 0


        # 코어 명단 최초 1회만 입력
        if Aiffel.list_status == 0:
            # 코어과정 그루명 입력
            member = input('코어과정 그루들의 이름을 입력하시오. : ')
            # 입력받은 그루명을 ,를 구분자로 분리하여 리스트에 담기
            grew_list = member.split(',')

            # 입력된 이름 순으로 01~18까지 번호를 부여하여 딕셔너리에 저장
            for i in range(len(grew_list)):
                #번호가 10보다 작을 경우 순번을 01~09로 저장
                if i + 1 < 10:
                    v = '0' + str(i + 1)
                else:
                    v = str(i + 1)

                # 코어 멤버 딕셔너리에 담기
                Aiffel.core_mem[grew_list[i]] = v
            # 최초 1회 입력을 클래스 변수에 저장한 후, 플래그 변경으로 그 다음 객체 생성부터는 입력받지 않음
            Aiffel.list_status = 1

        # 기수 코드 치환
        if self.th == '온라인 7기':
            nn = '29'
        elif self.th == '온라인 6기':
            nn = '28'
        else:
            nn = '27'

        # 과정 코드 치환
        if self.crs == '코어':
            c = '2'
        else:
            c = '1'

        # 코어 과정 그루 딕셔너리에서  key값으로 이름을 비교하여 해당 이름에 할당된 순번 확인
        for k, v in Aiffel.core_mem.items():
            if self.nm == k:
                xx = v

        # 학번 생성
        self.std_num = self.ent[2:] + nn + c + xx
        print(f'{self.nm}님의 학번은 {self.std_num}입니다.')

        Aiffel.std_num_cnt += 1

    # 학번 개수 출력 메서드 정의
    def get_id_num(self):
        return print(f'학번의 개수는 {Aiffel.std_num_cnt}개 입니다.')

    # 점수 입력 메서드 정의
    def score(self):
        try:
            # 재입력 상황 대비 스코어를 0으로 초기화
            quest_score = 0

            # 입력한 점수가 1~3의 범위에 들 때까지 반복
            while quest_score < 1 or quest_score > 3:
                quest_score = int(input(f'{self.nm}님에게 부여할 퀘스트 점수를 입력하세요(1~3): '))

                # 점수가 1~3 사이인지 검증
                if 1 <= quest_score <= 3:
                    # 개인 퀘스트 총점
                    self.psn_score += quest_score
                    # 입력된 퀘스트 점수 총점
                    self.psn_score_sum += quest_score

                    return True
                else:
                    # 범위 내의 점수 입력 유도
                    print('점수는 1~3점으로 입력하세요.')

        except:
            # 문자 입력 시, 정수형 점수 입력 유도
            print('점수는 1~3까지의 정수로 입력하세요.')

            return False

    # 패널티 메서드 정의
    def penality(self):
        # 퀘스트 점수는 음수가 될 수 있다.
        try:
            penalty_score = int(input(f'{self.nm} 그루에게 부여할 패널티 점수를 입력하세요: '))
            # 점수 총점 업데이트
            self.psn_score -= penalty_score
            # 패널티 점수 총점 업데이트
            self.psn_penalty_sum += penalty_score

            return True
        except:
            # 문자 입력 시, 정수형 점수 입력 유도
            print('점수는 정수로만 입력하세요.')

            return False

    # 객체 정보 호출 메서드 정의
    def display_info(self):
        # csv 파일에 입력할 데이터 리스트 생성
        list = [self.nm, self.std_num, self.crs, self.psn_score, self.psn_score_sum,self.psn_penalty_sum]

        # csv와 별개로 결과값 확인을 위한 dataframe 생성
        # grew_data = {
        #     'Fields' : ['이름','학번','과정','퀘스트 총점','퀘스트 입력 총점','퀘스트 패널티 총점'],
        #     'Rows' : [getattr(self,'nm',None),
        #               getattr(self,'std_num',None),
        #               getattr(self,'crs',None),
        #               getattr(self,'psn_score',None),
        #               getattr(self,'psn_score_sum',None),
        #               getattr(self,'psn_penalty_sum',None)]
        # }
        #
        # grew_df = pd.DataFrame(grew_data)
        # display(grew_df)

        return list

    # 중도 포기 그루 삭제 메서드 정의
    def delete_grew(self, name):
        # name 키와 그 키의 밸류 삭제
        print(f'코어 과정 그루 목록에서 {name}님을 삭제합니다.')
        del Aiffel.core_mem[name]

        #삭제된 인원 뒤에 있는 그루들의 순번이 바뀌게 되면 학번도 바뀌어야 하므로 순번은 유지
        return print(f'갱신된 그루 목록은 {Aiffel.core_mem}입니다.')


# Aiffel_Group 클래스 정의
class AiffelGroup(Aiffel):
    def __init__(self):
        # 그루 이름으로 구성된 리스트 생성
        self.grew_mem = [i for i in Aiffel.core_mem]
        self.group_nm = {'상생': '', '신뢰': '', '열정': '', '이끔': '', '성장': '', '가치': '', '공유': '', '확산': ''}

        for k,v in self.group_nm.items():
            # 인덱스 별 value에 2~4명의 랜덤 그루 배정
            if len(self.grew_mem) >= 4:
                self.group_nm[k] = random.sample(self.grew_mem, random.randint(2, 4))
                # 배정된 그루는 리스트에서 제거
                for x in self.group_nm[k]:
                    self.grew_mem.remove(x)
            else:
                # 나머지 연산
                self.group_nm[k] = self.grew_mem
                # 배정된 그루는 리스트에서 제거
                for x in self.group_nm[k]:
                    self.grew_mem.remove(x)
        return print(f'추첨된 조는 {self.group_nm} 입니다.')

    # 조별 점수 - 길드 점수 연동 메서드
    def group2guild_score(self, name, score, guild, grew):# 신뢰, 3점, 길드 객체, 그루 객체
        for i in self.group_nm:
            # 조 이름 검증
            # 조 == 조
            if name == i:
                # 길드 검증
                for x in self.group_nm[i]:
                    # x == 그루 이름
                    for y in guild.guild_nm:
                        # y == 길드명
                        for z in guild.guild_nm[y]:
                            if x == z:
                                # 길드 점수 갱신 메서드 호출
                                print()
                                print(f'{name}조가 {score}점을 획득하여 조원인 {x}님의 소속인 {y} 길드에 {score}이 연동됩니다.')
                                guild.guild_score(y,score,grew)



# Aiffel_Guild 클래스 정의
class AiffelGuild(Aiffel):
    def __init__(self):
        # 길드 스코어 속성
        self.guild_scr = {'응':0,'힌튼':0, '하사비스':0}
        # 그루 이름으로 구성된 리스트 생성
        self.grew_mem = [i for i in Aiffel.core_mem]
        # 그루가 배정돤 길드 딕셔너리 초기화
        self.guild_nm = {'힌튼': '', '응': '', '하사비스': ''}

        # 인덱스 별 value에 5~6명의 랜덤 그루 배정
        for k,v in self.guild_nm.items():
            # list의 그루 수가 6명보다 클 때 5 혹은 6의 랜덤 값으로 길드 배정
            if len(self.grew_mem) >= 6:
                # 그루 리스트에서 무작위 인원을 5 혹은 6명으로 랜덤 배정
                self.guild_nm[k] = random.sample(self.grew_mem, random.randint(5, 6))
                # 배정된 그루는 리스트에서 제거
                for x in self.guild_nm[k]:
                    self.grew_mem.remove(x)
            # list의 그루 수가 6명보다 작으면 남아 있는 인원들을 남은 길드에 배정
            else:
                self.guild_nm[k] = self.grew_mem
        return print(f'추첨된 길드는 {self.guild_nm}입니다.')

    # 길드 점수 입력 메서드
    def guild_score(self, name, score, grew):
        for i in self.guild_nm:
            # 입력 받은 길드 이름과 딕셔너리 인덱스의 키 값이 같을 때
            # True : 길드명 == 길드명
            if name == i:
                # 길드 점수 갱신
                self.guild_scr[name] += score
                print(f'{name}길드의 점수는 {self.guild_scr[name]}점입니다.')

                # 이중 for문으로 그루 이름 비교
                for x in self.guild_nm[i]:
                    for y in grew:
                        if x == y.nm:
                            # 매개변수로 넘어온 점수가 음수일 경우
                            if score < 0:
                                # 총점 갱신
                                y.psn_score += score
                                # 패널티 총점 갱신
                                y.psn_penalty_sum -= score
                            # 매개변수로 넘어온 점수가 양수일 경우
                            else:
                                # 총점 갱신
                                y.psn_score += score
                                # 합산 점수 갱신
                                y.psn_score_sum += score
                            print(f'{i} 길드의 {y.nm} 그루는 {score}점 획득했으므로, 현재 {y.psn_score}점입니다.')

    # 길드 점수 정보 표시를 위한 display_info 메서드 오버라이딩
    def display_info(self, grew):
        field_list = ['이름', '학번', '과정', '퀘스트 총점', '퀘스트 입력 총점', '퀘스트 패널티 총점', '소속 길드', '길드 점수']
        row_list = []
        # 길드 이름 딕셔너리 루프 : x = 길드명
        for x in self.guild_nm:
            # 길드에 소속된 그루 루프 : y = 길드원
            for y in self.guild_nm[x]:
                # grew 객체 루프 : z = 그루 객체
                for z in grew:
                    # 그루 이름 == 길드원 이름
                    if z.nm == y:
                        # 길드 점수 딕셔너리 루프 : i = 길드명
                        for i in self.guild_scr:
                            # guild.nm 길드명과 guild.scr 길드명이 같을 때
                            if x == i:
                                # csv 파일에 입력할 데이터 리스트 생성
                                row_list.append([z.nm, z.std_num, z.crs, z.psn_score, z.psn_score_sum, z.psn_penalty_sum, x, self.guild_scr[i]])

        with open(f'/Users/leeseonjae/Downloads/grew_guild_data.csv', 'w', newline='') as f:
            writer = csv.writer(f)
            # 1행에 필드 추가
            writer.writerow(field_list)
            # 2행부터 로우 추가
            writer.writerows(row_list)




# 그루 리스트 생성
grew_name_list = ['강영현','김경민','김민기','김승순','김양희','김영신','오우진','윤혜윤','이상원','이선재','이슬','이승환','전민규','조보겸','조수민','최강훈','한현종','홍채림']

# 그루 객체 리스트 생성
grew = [Aiffel(i,'2023','온라인 7기','코어') for i in grew_name_list]

# 학번 개수 확인
grew[0].get_id_num()
print('\n')

# 퀘스트 점수 입력 메서드 호출
print('*'*24,'퀘스트 점수 입력','*'*24)
for i in grew:
    score_status = False
    # return 값이 True일 때까지 반복
    while score_status == False:
        # 점수 정상 입력 시 종료
        if i.score() == True:
            break
print('*'*62)
print('\n')

# 페널티 점수 입력 메서드 호출
print('*'*24,'패널티 점수 입력','*'*24)
for i in grew:
    penalty_status = False
    # return 값이 True일 때까지 반복
    while penalty_status == False:
        # 점수 정상 입력 시 종료
        if i.penality() == True:
            break
print('*'*62)
print('\n')

print('*'*22,'개인 퀘스트 정보 출력','*'*22)
# csv 파일 출력
# 필드 리스트 생성
field_list = ['이름','학번','과정','퀘스트 총점','퀘스트 입력 총점','퀘스트 패널티 총점']
# 빈 로우 리스트 생성
row_list = []

# 각 객체 정보 리스트에 추가
for i in grew:
    row_list.append(i.display_info())
with open(f'/Users/leeseonjae/Downloads/grew_data.csv','w',newline='') as f:
    writer = csv.writer(f)
    # 1행에 필드 추가
    writer.writerow(field_list)
    # 2행부터 로우 추가
    writer.writerows(row_list)
print('*'*62)
print('\n')

# 김경민, 김영신 그루 삭제
print('*'*21,'김경민, 김영신 그루 삭제','*'*21)
grew[0].delete_grew('김경민')
grew[0].delete_grew('김영신')
print('*'*62)
print('\n')

print('*'*22,'길드 및 조 랜덤 배정','*'*22)
aiffel_group = AiffelGroup()
aiffel_guild = AiffelGuild()
print('*'*62)
print('\n')

# 길드 점수 갱신 메서드 호출
print('*'*21,'길드 및 개인 점수 확인','*'*21)
aiffel_guild.guild_score('응',2,grew)
print()
aiffel_guild.guild_score('힌튼',-1,grew)
print()
aiffel_guild.guild_score('하사비스',1,grew)
print('*'*62)
print('\n')

# 그룹 점수 갱신 메서드 호출
print('*'*22,'조 점수를 길드에 연동','*'*22)
aiffel_group.group2guild_score('상생',3,aiffel_guild, grew)
print()
aiffel_group.group2guild_score('신뢰',1,aiffel_guild, grew)
print()
aiffel_group.group2guild_score('열정',2,aiffel_guild, grew)
print()
aiffel_group.group2guild_score('이끔',3,aiffel_guild, grew)
print()
aiffel_group.group2guild_score('성장',3,aiffel_guild, grew)
print('*'*66)
print('\n')

# 길드 점수를 포함한 display_info 메서드 오버라이딩
aiffel_guild.display_info(grew)