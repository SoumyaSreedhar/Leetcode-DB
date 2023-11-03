
"""
Solutn: TC : o(N), SC: o(N)
Solution: Time Complexity (TC): O(N), Space Complexity (SC): O(N)

1. The problem is solved in two steps:

   a. Left-to-Right Pass:
   
      We initiate the process at index 1, or we can use a `prev` variable initialized to 1 to signify that when we start, excluding the first element leaves us with a product of 1. When we reach the 2nd index, we look back and multiply the current running product by the existing number, effectively excluding the number in the input array. Similarly, at the 3rd index, we look back again. At this point, the product we have will be running one step behind where we are in the array.

   2. Right-to-Left Pass:
   
      We perform a similar process in reverse order. Here, we require the `prev` variable because we are multiplying the data in both the 'result' array and the input array. So, we cannot start from the last index directly; we need 'prev' to keep us one step behind, maintaining the running product and result data but in a left-to-right pass.

In essence, we first calculate the product of all elements to the left of each index and store these values in the 'result' array. Then, we reset the product and use it to calculate the product of all elements to the right of each index, multiplying it with the corresponding product from the left pass to obtain the final result.

The result array now holds the product of all elements except the one at the corresponding index, effectively solving the problem with an efficient time complexity of O(N) and a space complexity of O(N).

"""





class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        
        result  = [1 for i in range(len(nums))]
        product = 1
        
        #left pass
        for i in range(1,len(nums)):
            product = nums[i-1]*product
            result[i]= product
        
        #reset product for right pass with reverse loop
        product = 1
        prev = 1
        
        #right pass
        for i in range(len(nums)-1,-1,-1):
            product = product*prev
            result[i] = result[i]*product
            prev = nums[i]
        return result
       
           
            
            
        