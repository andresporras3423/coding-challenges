# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search_insert(nums, target)
  init=0
  last=nums.length-1
  found=false
  until found
      mid = (last+init)/2
      if(nums[mid]==target)
          return mid
      else
          
          if(nums[mid]>target)
              last = mid
          else
              init=mid
          end
      end
      if(mid==(last+init)/2)
          p mid
          return mid+2 if nums[mid+1]!=nil && nums[mid+1] <target
          return mid+1 if nums[mid]<target
          return mid
      end
  end
end