# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def merge_two_lists(l1, l2)
  list=ListNode.new
  compare_nodes(l1, l2, list)
  temp=list.next
  loop do
      if l1!=nil && (l2.nil? || l1.val<l2.val)
         temp=ListNode.new(l1.val)
         compare_nodes(l1.next, l2, list.next)
     elsif l2!=nil
         list=ListNode.new(l2.val)
         compare_nodes(l1, l2.next, list.next)
      end
  end
  #sol = @list[0]
  #add_nodes(sol, 1)
  #sol
  #p list.next.val
  list
end

def compare_nodes(l1, l2, list)
  p list.val
  
end

def add_nodes(sol, n)
  return if n>@list.length
  sol.next = @list[n]
  add_nodes(sol.next, n+1)
end