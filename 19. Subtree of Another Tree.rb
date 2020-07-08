# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(t, s)
  dfs(t, s)
end

def dfs(t, s)
 return false if t.nil?
  #p "s #{s.val} t #{t.val}"
 if(s.val==t.val)
     #p "hello world"
     return true if checkEquality(t,s)
 end
  return dfs(t.left, s) || dfs(t.right, s)
end

def checkEquality(t,s)
  return true if t.nil? && s.nil?
  return false if [t,s].include?(nil)
 if(t.val==s.val)
     return checkEquality(t.left,s.left) && checkEquality(t.right,s.right)
 end
  return false
end