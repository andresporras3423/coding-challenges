#link to the original coding challenge; https://leetcode.com/problems/remove-invalid-parentheses/submissions/
# @param {String}
# @return {String[]}
def remove_invalid_parentheses(s)
    return [s.split('').select{|s| s!='(' && s!=')'}.join('')] if s.split('').select{|s| s=='(' || s==')'}.length<2
    @len=0
    @solutions=Hash.new
    sLists = Hash.new
    sLists[s]=0
    keep_removing(sLists)
    @solutions.keys.length==0 ? [s.split('').select{|s| s!='(' && s!=')'}.join('')] : @solutions.keys
end
#DFS keep removing until a size provide valid solutions
def keep_removing(sLists)
    sLists.each_key{|s| @solutions[s]=0 if is_sol(s)}
    return if @solutions.keys.length>0 || sLists.keys[0].split('').select{|s| s=='(' || s==')'}.length==2
    newList=Hash.new
    sLists.keys.each do |s|
        sArray = s.split('')
       (sArray.length).times do | i|
          newList[sArray.clone.tap{|t| t.delete_at(i)}.join('')]=0 if (s[i]=='(' || s[i]==')')
       end
    end
    #p newList
    keep_removing(newList)
end
#check if s is valid
def is_sol(s)
    sArray = s.split('')
    validParentheses=0
    for i in 0...sArray.length do
       if sArray[i]=='('
           validParentheses+=1
       elsif sArray[i]==')'
          validParentheses-=1 
       end
       return false if validParentheses<0
    end
    true if validParentheses==0
end