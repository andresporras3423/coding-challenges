# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
  comb = Hash.new
  p.split("").each do |p0|
      if comb[p0].nil?
          comb[p0]=1
      else
          comb[p0]+=1
      end
  end
  sol=[]
  sArray = s.split("")
  pArray = p.split("")
  (0..sArray.length-pArray.length).each do |i|
      comb_clone = comb.clone
      is_sol=true
      (i...pArray.length+i).each do |j|
          if comb_clone[sArray[j]]!=nil && comb_clone[sArray[j]]>0
              comb_clone[sArray[j]]-=1
          else
              is_sol=false
              break
          end
      end
      #p is_sol
      sol.push(i) if is_sol
  end
  sol
end