# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  repeated = Hash.new
  nums.each do |n|
      return true unless repeated[n].nil?
      repeated[n]=0
  end
  false
end