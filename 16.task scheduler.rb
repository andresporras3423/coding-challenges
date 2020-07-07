# @param {Character[]} tasks
# @param {Integer} n
# @return {Integer}
def least_interval(tasks, n)
  return tasks.length if n==0
  total = tasks.length
  hash = Hash.new
  tasks.each{|t| hash[t] = hash[t].nil? ? 1 : hash[t]+1}
  maxValue = 0
  hash.each_key{|k| maxValue = maxValue<hash[k] ? hash[k] : maxValue}
  return tasks.length if hash.count == tasks.length
  eqMax = 0
  hash.each_key{|k| eqMax = hash[k]==maxValue ? eqMax+1 : eqMax}
  eqMax
  n = eqMax-1>n ? eqMax-1 : n
  aditional = (tasks.length-maxValue)-((maxValue-eqMax)*n)>0 ? (tasks.length-maxValue)-((maxValue-1)*n) : 0
  aditional = ((n-(eqMax-1)>0 ? n-(eqMax-1) : 0)*(maxValue-1)>(tasks.length-maxValue*eqMax)) ? 0 : ((tasks.length-maxValue*eqMax)-(n-(eqMax-1)>0 ? n-(eqMax-1) : 0)*(maxValue-1))
  (maxValue-1)*(n+1)+(1)+(eqMax-1)+aditional
end