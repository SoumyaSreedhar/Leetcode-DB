class Solution:
    def intersect(self, nums1: List[int], nums2: List[int]) -> List[int]:
        if len(nums1) == 0 or len(nums2) == 0:
            return []
        
        num1 = sorted(nums1)
        num2 = sorted(nums2)
        
        p1 = 0
        p2 = 0
        
        result = []
        
        while(p1<len(num1) and p2<len(num2)):
            
            if num1[p1] == num2[p2]:
                result.append(num1[p1])
                p1 = p1+1
                p2 = p2+1
                
            elif num1[p1]<num2[p2]:
                p1 = p1+1
            
            else: 
                p2 = p2+1
                
        return result
            
   