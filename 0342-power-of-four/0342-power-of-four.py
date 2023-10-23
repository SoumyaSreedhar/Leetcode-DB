'''
Solution:
logb to the base will always be awhole number if it is a perfect power of a number.
4^2 = 16, applying log on both sides will give us log 16/log 4= 1 which is a whole number, similarly log 64/log4 =3 which is a whole nymber.






'''


class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        if n<1:
            return False
        if log(n,4)%1==0:
            return True