fish_list = [{"이름": "Nemo", "speed":3},{"이름": "Dory", "speed":5},{"이름": "Sam", "speed":10}]

def show_fish_movement_comprehension(fish_list):
    # 각 물고기가 얼마나 움직이는지를 출력
    [print(f"{fish['이름']} is swimming at {fish['speed']} m/s") for fish in fish_list]

def show_fish_movement_generator(fish_list):
    # 각 물고기가 얼마나 움직이는지를 출력하는 제너레이터
    def fish_movement(fish_list):
        for fish in fish_list:
            yield f"{fish['이름']} is swimming at {fish['speed']} m/s"

    # 제너레이터를 사용하여 출력
    for movement in fish_movement(fish_list):
        print(movement)

print("Using Comprehension:")
show_fish_movement_comprehension(fish_list)

print("Using Generator:")
show_fish_movement_generator(fish_list)