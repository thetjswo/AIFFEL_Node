# 프사 이미지 관련
from IPython.display import Image, display
import sys
import re

# DISP관련
import pandas as pd

class Person:
  # 생성자
  def __init__(self): # 추가로 들어갈 예정(name, age...)
    # 초기 속성 설정
    self.name = None  # 이름
    self.age = None   # 나이
    self.mbti = None  # MBTI
    self.profile_image = None  # 프로필 이미지
    self.interests = None  # 최근 관심사
    self.career_interests = None  # 희망 진로
    self.field_of_interests = None  # 관심 분야
    self.hobbies = None  # 취미
    self.gender = None  # 성별
    self.favorite_movies = []  # 좋아하는 영화 목록
    self.favorite_facilitator = '[퍼실]김정은/수원/힌튼😀'

    # 프로필 설정 및 출력
    self.set_profile()
    #self.set_others()
    self.display_info()

  # 프로필 정보(상위 메서드)
  def set_profile(self):
    self.profile_img() # 프사 사진
    self.set_mbti() # mbti
    # self.set_others() # 나머지 프로필들 #한번에 입력받는거보다 따로 입력받는게 나을듯
    self.interests = None  # 최근 관심사
    self.career_interests = None # 희망진로
    self.field_of_interests = None # 관심분야(AI)



  # 프사이미지
  def profile_img(self):
      # 이미 프로필 이미지가 설정된 경우 메서드 실행을 스킵
      if self.profile_image is not None:
        return

      print("당신의 프사를 업로드해주세요! 꼭 프사아 아니어도 좋아요!😀")
      """
      실행 환경에 따라 적절한 파일 선택 방식을 사용하는 메서드.
      Colab에서는 files.upload()를, 로컬 환경에서는 Tkinter filedialog를 사용.
      """
      # Colab 환경 체크
      if 'google.colab' in sys.modules:
          from google.colab import files
          uploaded = files.upload()

          # 업로드된 파일 중 이미지 파일(jpg, png) 찾기
          for filename in uploaded.keys():
              if filename.endswith('.jpg') or filename.endswith('.png'):
                  self.profile_image = filename
                  break
          else:
              print("이미지 파일(jpg, png)을 업로드해주세요.")
      else:
          # 로컬 환경에서 실행하는 경우
          from tkinter import Tk, filedialog

          root = Tk()
          root.withdraw()  # Tk 창 숨기기
          file_path = filedialog.askopenfilename(filetypes=[("Image files", "*.jpg *.png")])
          if file_path:
              self.profile_image = file_path
          else:
              print("이미지 파일(jpg, png)을 선택해주세요.")



  # mbti
  def set_mbti(self):
    """사용자의 프로필 정보를 설정하는 메서드입니다."""
    mbti_list = ['1. INTJ', '2. INTP', '3. ENTJ', '4. ENTP', '5. INFJ', '6. INFP',
                  '7. ENFJ', '8. ENFP', '9. ISTJ', '10. ISFJ', '11. ESTJ', '12. ESFJ', '13. ISTP', '14. ISFP', '15. ESTP', '16. ESFP']
    mbti_dict = {str(i+1): mbti.split('. ')[1] for i, mbti in enumerate(mbti_list)}
    output = [", ".join(mbti_list[i:i+4]) for i in range(0, len(mbti_list), 4)]
    output_string = "\n".join(output)

    while True:
        print(output_string)
        print('='*100, '\n')
        p_mbti = input('당신의 MBTI는 무엇인가요?! 위 리스트를 보고 번호 또는 문자를 입력해주세요 :  ')

        if re.search("[가-힣]", p_mbti):
            print('MBTI는 영어로만 입력해주세요~! 다시 입력 부탁드립니다.')
            print('='*100, '\n')
            continue

        if p_mbti in mbti_dict:
            p_mbti = mbti_dict[p_mbti]
        else:
            p_mbti = p_mbti.upper()
            if p_mbti not in [mbti.split('. ')[1] for mbti in mbti_list]:
                print("유형에 없는 MBTI네요. 다시 입력해주세요 :D")
                print('-'*100, '\n')
                continue

        break

    self.mbti = p_mbti  # 클래스의 mbti 속성 업데이트
    print(f'당신의 MBTI는 {self.mbti}군요! 만나서 반가워요!')
    print('='*100, '\n')

    """
    - 위 2개의 하위 메서드 제외 나머지 프로필 입력받는 곳
    - 입력받은 프로필정보들을 set_profile로 전달
    """
  def set_others(self):

    # arguments별 입력 코드
    list = []

    # 취미 입력 - 추후 함수화하여 예외처리는 재귀호출로 처리할 예정
    hobby_list = {1:'운동', 2:'요리',3:'음악',4:'여행',5:'독서',6:'기타'}
    hobbies = ''

    while hobbies == '':
        hobbies = input("""당신의 취미를 숫자 혹은 문자로 입력하세요
        (1:\'운동\', 2:\'요리\',3:\'음악\',4:\'여행\',5:\'독서\',6:\'기타\'): """)

        if hobbies == '':
            print('취미는 공백일 수 없습니다. 다시 입력하세요.')
        else:
            if hobbies.isdigit():
                hobbies = int(hobbies)

            for k, v in hobby_list.items():
                if hobbies == k or hobbies == v:
                    if hobbies == 6 or hobbies == '기타':
                        etc = ''
                        while etc.isdigit() == True or etc == '':
                            etc = input('리스트에 없는 취미를 가지고 계신다면 그 취미를 입력하세요. : ')
                            if etc.isdigit() == True or etc == '':
                                print('취미는 숫자나 공백이 될 수 없습니다.')
                            else:
                                list = etc
                    else:
                        list = v
    #residence
    #marriage

    #guild
    while gender == '' or gender.isdigit() == True:
        gender = input('성별을 입력해주세요. : ')
        if gender == '' or gender.isdigit() == True:
            print('성별은 필수 입력 값이며, 숫자일 수 없습니다. 다시 입력해주세요.')
        elif gender == '중성':
            print('이 세상에 중성인 사람이 있을까요?')
        else:
            list.append(gender)

    """
    age 수정
    """
    try:
      age_input = input('나이가 어떻게 되세요? 만 나이 혹은 태어난 년도로 말해주세요.^^ :')
      age = float(age_input)

      # 나이숫자별 오입력에 대한 처리
      if len(age_input) == 2:
          print(f'만 {int(age)}세이시군요. 생일이 지나시면 {int(age) + 1}세가 되시겠네요~')

      elif len(age_input) == 4:
          print(f'{int(age)}년에 태어나셨군요. 동안이시네요!')

      elif age <= 0:
          print('앞에 \'-\'가 붙었어요! 우리 나이는 자연수인 거 아시죠? ^^')

    # 숫자 개수 입력 에러 처리
    except ValueError:
        print(f'숫자를 {len(age_input)} 개 입력하셨어요. 나이나 태어나신 연도 4자리를 입력해주세요!')

    # 예상치 못한 에러의 경우
    except Exception as e:
        print(f'알 수 없는 오류가 발생했습니다. {e}')

    # 최종 self에 전달할때
    age = str(int(age)) #로 입력 32.0 -> 32 -> '32'

    #interests
    #nick_dic = {}
    #nickname = '0'
    #nick_reason = '0'

    while nickname.isdigit() == True or nickname == '':
        nickname = input('당신의 별명은 무엇인가요? ')

        if nickname.isdigit() == True or nickname == '':
            print('문자로 입력해주세요.')
        else:
            while nick_reason.isdigit() == True or nick_reason == '':
                nick_reason = input(f'당신의 별명이 {nickname}인 이유도 알 수 있을까요? ')

                if nick_reason.isdigit() == True or nick_reason == '':
                    print('문자로 입력해주세요.')
                else:
                    nick_dic.setdefault(nickname, nick_reason)
                    list.append(nick_dic)

    #career_interest
    # 예외처리 추가 (뇌절  ver...?)
    while True:
      # 좋아하는 퍼실 입력 받기
      facilitator_input  = input('AIFFEL에서 당신이 가장 좋아하는 퍼실님은 누군가요?!(당신의 센스를 믿습니다.😂)')

      # 정은 퍼실님 아닐경우 드립 1번..
      if '정은' not in facilitator_input :
        print("정말이세요?! 전 여전히 당신의 센스를 믿어요(?!) 다시한번만 생각해보세요 😂")
        second_chance = input('다시 한 번 생각해볼까요? : ')

        # 두번째도 입력
        # 정은 퍼실님 입력한 경우 그대로 favorite_facilitator로 입력
        if '정은' in second_chance:
          self.favorite_facilitator = second_chance
          break
        # 아닌 경우도 다른 입력값 그대로 favorite_facilitator로 설정
        else:
          self.favorite_facilitator = second_chance
          break
      # 처음부터 정은 퍼실님 입력한 경우 그대로 favorite_facilitator로 설정
      else:
          self.favorite_facilitator = facilitator_input
          break





    # mbti 유형별
    mbti_movie_preferences = {
            "ISTJ" : {"세상소금형", "역사", "사극"},
            "ISFJ" : {"임금 뒤 권력형", "교육", "문화"},
            "INTJ" : {"과학자형", "미스터리"},
            "INFJ" : {"예언자형", "드라마", "연속극"},
            "ISTP" : {"백과사전형", "사회풍자적 메시지가 있는"},
            "ISFP" : {"성인군자형", "애니메이션", "만화"},
            "INFP" : {"잔다르크형", "판타지"},
            "INTP" : {"아이디어 뱅크형", "과학"},
            "ESTP" : {"수완 좋은 활동가형", "액션"},
            "ESFP" : {"사교적 유형", "뮤지컬"},
            "ENFP" : {"스파크형", "어드밴처"},
            "ENTP" : {"발명가형", "블랙 코미디"},
            "ESTJ" : {"사업가형", "법정드라마"},
            "ESFJ" : {"친목도모형", "하이틴", "우정"},
            "ENFJ" : {"언변 능숙형", "로맨스 코미디"},
            "ENTJ" : {"지도자형", "스릴러", "공포"}
        }

    # 입력받은 MBTI 유형에 따른 영화 장르 추천 문구 작성 및 input 받기
    if self.mbti in mbti_movie_preferences:
        mbti_info = mbti_movie_preferences[self.mbti] # 입력받은 mbti로 key선택
        mbti_type = mbti_info.pop() # mbti유형별 설명 추출
        genres = ", ".join(mbti_info) # 장르들 문자열로 전환 후 ','로 이어 붙이기

        # 유형별 선호 장르 출력 문구 설정
        print(f"보통 {self.mbti}는 '{mbti_type} 유형으로 {genres} 장르를 좋아한다고 합니다.")

        # 정보 input 요구
        self.favorite_movies.append(input(f"{mbti_type} 유형인 당신! 당신의 인생영화는 무엇인가요? : "))

    # interest 관련 3개 정보 메서드 1개로 모두 입력 받기
    def set_interests(self):
        # 각 항목별 관심사 목록
        recent_interests_info = ['1. 데이터 과학', '2. 인공지능', '3. 클라우드 컴퓨팅', '4. 사이버 보안', '5. 기타']
        career_interests_info = ['1. 데이터 분석가', '2. 머신러닝 엔지니어', '3. 데이터 엔지니어', '4. AI 연구원', '5. 창업']
        field_interests_info = ['1. 머신러닝', '2. 딥러닝', '3. 컴퓨터 비전', '4. 자연어 처리', '5. 로봇공학']

        # 최근 관심사 입력
        self.recent_interest = self._get_interest_input(recent_interests_info, "최근 관심사를 선택하세요: ")

        # 관심 진로 입력
        self.career_interest = self._get_interest_input(career_interests_info, "관심 진로를 선택하세요: ")

        # 관심 분야 입력
        self.field_of_interest = self._get_interest_input(field_interests_info, "AI 관련 관심 분야를 선택하세요: ")

    def _get_interest_input(self, interests_info, prompt):
        while True:
            print("\n".join(interests_info))
            print("0. 직접 입력하기")
            choice = input(f"{prompt} (또는 직접 입력하고 싶다면 0번을 입력해주세요): ")

            if choice == "0":
                return input("관심사를 입력해주세요: ")
            elif choice.isdigit() and 1 <= int(choice) <= len(interests_info):
                return interests_info[int(choice)-1].split('. ')[1]
            else:
                print("올바른 번호를 선택해주세요.")
                continue


  def display_info(self):
    """
    사용자의 프로필 정보를 이미지와 함께 출력하는 메서드
    """
    # 프로필 이미지 출력
    if hasattr(self, 'profile_image') and self.profile_image:
        display(Image(filename=self.profile_image))
    else:
        print("프로필 이미지가 설정되지 않았습니다.")

    # 프로필 정보를 DataFrame으로 생성
    profile_data = {
        '항목': ['이름', '나이', '성별', '취미', 'MBTI', '인생영화', '좋아하는 퍼실'],
        '정보': [getattr(self, 'name', '정보 없음'),
                getattr(self, 'age', '정보 없음'),
                getattr(self, 'gender', '정보 없음'),
                getattr(self, 'hobbies', '정보 없음'),
                getattr(self, 'mbti', '정보 없음'),
                getattr(self, 'favorite_movies', '정보 없음'),
                self.favorite_facilitator]  # 초기값 출력
    }
    profile_df = pd.DataFrame(profile_data)

    # 프로필 정보 출력
    display(profile_df)



