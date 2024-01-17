class MakeTop:
    def __init__(self, shape, color):
        self.shape = shape
        self.color = color

    def check_top(self):
        return f'shape is {self.shape}, color is {self.color}'

    def use_func(self):
        a = top1()
        b = top2()
        return a +' '+b


def top1():
    return 'top1'


def top2():
    return 'top2'