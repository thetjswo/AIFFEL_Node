from MakeCap import *
from MakeTop import *
from MakeBottom import *
from MakeShoes import *

color = 'black'

cap = MakeCap('fedora', color)
print(cap.check_cap())
print(cap1())
print(cap2())
print('*'*30)

top = MakeTop('shirts', color)
print(top.check_top())
print(top1())
print(top2())
print(top.use_func())
print('*'*30)

bottom = MakeBottom('jean', color)
print(bottom.check_bottom())
print(bottom1())
print(bottom2())
print('*'*30)

shoes = MakeShoes('loafer', color)
print(shoes.check_shoes())
print(shoes1())
print(shoes2())