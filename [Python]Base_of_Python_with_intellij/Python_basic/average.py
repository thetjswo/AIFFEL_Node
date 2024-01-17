def sub_scr():
    subject = ['국어', '영어', '수학', '과학', '사회']
    score = list(map(int, input("점수를 입력하세요: ").split(',')))
    mapped_dic = {k: v for k, v in zip(subject, score)}

    return mapped_dic


def calc(fn):
    dic = fn()

    def avg():
        # 각 과목 점수의 총합을 구하는 표현식
        sum = 0
        for x in [i for i in dic.values()]:
            sum += x
        return sum / 5

    return avg()


@calc
def yuri():
    return sub_scr()


@calc
def cheolsu():
    return sub_scr()


@calc
def jjanggu():
    return sub_scr()


print(f"yuri\'s score is {yuri}, cheolsu\'s score is {cheolsu}, jjanggu\'s score is {jjanggu}.")
