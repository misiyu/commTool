#coding=utf-8
# 扩展欧几里德算法计算  ax+by = gcd(a,b)
def ext_euclid ( a , b ):
     if (b == 0):
         return 1, 0, a
     else:
         x , y , q = ext_euclid( b , a % b )
         x , y = y, ( x - (a // b) * y )
         return x, y, q
print ext_euclid(17,2135733082216268400)
