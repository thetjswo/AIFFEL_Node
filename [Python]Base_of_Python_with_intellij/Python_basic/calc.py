def power(a, b):
    return a ** b

def divide(a, b):
    return f'몫: {a//b}, 나머지: {a%b}, 소수점: {float(a/b)}'

def factorial(a):
    res = 1
    for i in range(a):
        x = i+1
        res *= x

    return res