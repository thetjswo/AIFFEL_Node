# # 최종 결과분
# !pip install ColabTurtlePlus # ColabTurtle 라이브러리 설치
# from ColabTurtlePlus.Turtle import * # ColabTurtle 라이브러리에서 Turtle 클래스를 import
#
#
# # 미로 데이터
# maze = [
#     [0, 1, 0, 0, 0],
#     [0, 0, 0, 1, 0],
#     [0, 1, 1, 0, 0],
#     [0, 0, 1, 1, 0],
#     [0, 0, 0, 0, 0]
# ]
#
# # 추가 : 초기값 지정
# cnt = 0
# # 시작 위치와 목적지 위치
# start_x, start_y = 0, 0
# end_x, end_y = 4, 4
#
# # 터틀 초기 설정
# window = (300, 300)
# initializeTurtle(window, 'logo')
# speed(1)
#
# # 미로 찾기 알고리즘
# def solve_maze(x, y):
#   global cnt
#   # 목적지에 도착한 경우 - 현재 좌표와 목적지 좌표 비교
#   if x == end_x and y == end_y:
#
#       # "미로를 찾았습니다" 라는 문장을 출력하고
#       print('미로를 찾았습니다.')
#
#       # True를 반환한다.
#       return True
#
#   # 현재 위치에서 갈 수 있는 방향(상,하,좌,우) 탐색
#   for dx, dy in [(0, 1), (1, 0), (0, -1), (-1, 0)]:
#       nx, ny = x + dx, y + dy # 이동 좌표
#
#       # 미로 범위(0,0 ~ 4,4) 내에 있고, 갈 수 있는 길(좌표 값이 0)인 경우
#       if 0 <= nx < 5 and 0 <= ny < 5 and maze[nx][ny] == 0:
#
#           # 갔던 길 표시(좌표값 2로 변경)
#           maze[nx][ny] = 2
#           # 가는 길의 펜색을 보라색으로 설정
#           pencolor('purple')
#
#           # 도화지에 펜 붙이기
#           pendown()
#
#           # 다음 위치로 이동
#           goto(nx*30, ny*30)  # 거북이 다음 위치로 이동(각 축 30만큼 이동)
#
#           # 도화지에서 펜 떼기
#           penup()
#
#           # 코드를 해석해주세요!!
#           # solve_maze()함수를 호출하고, 목적지에 도착을 했다면 True를 반환하여 if 조건문을 통과한 뒤 다시 True를 반환한다.
#           # 그게 아니라면 이전으로 돌아간다.
#           if solve_maze(nx, ny):
#               return True
#           else:
#               # 다시 이전으로 돌아가기
#               # 펜 색을 빨간색으로 설정
#               pencolor('red')
#
#               # 도화지에 펜 붙이기
#               pendown()
#               # 돌아가는 길을 각 축 30씩 이동
#               goto(x*30, y*30)
#               # 도화지에서 펜 떼기
#               penup()
#               # 표시된 길 0표시(지우기)
#               maze[nx][ny] = 0
#
#   # 길을 찾지 못한 경우
#   # "길을 찾을 수 없습니다"를 출력하고
#   # False를 리턴
#   # 5번동안 찾지 못하면 길찾기 종료
#   if cnt < 5:
#     print("길을 찾을 수 없습니다.")
#     cnt += 1
#     return False
#   else:
#     print("더 이상 길을 찾지 않겠습니다.")
#     return True
#
# # 시작 위치에서 미로 찾기 시작
# goto(start_x, start_y)
# solve_maze(start_x, start_y)
# import pprint
# pprint.pprint(maze)