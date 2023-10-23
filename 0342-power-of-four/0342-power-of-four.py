class Solution:
    def isPowerOfFour(self, n: int) -> bool:
        if n<1:
            return False
        if log(n,4)%1==0:
            return True