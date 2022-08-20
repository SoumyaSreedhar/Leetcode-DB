class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        
        
        myDict = {}
        
        for i in range(len(nums)):
            
            if target-nums[i] not in myDict:
                myDict[nums[i]]= i
            else:
                return [myDict[target-nums[i]],i]

        
                
         
                
                
                
                
                
                