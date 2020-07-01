# @param {Integer} num
# @return {Integer[]}
def count_bits(num)
  return [0] if num==0
  return [0,1] if num==1  
  list =[0,1]
  sol=[0,1]
  j=0
  (0..num-2).each do |i|
     if(j==list.length)
         j=0
         list = sol.clone
     end
     sol.push(list[j]+1)
      j+=1
  end
  sol
end