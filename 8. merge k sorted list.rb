# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode[]} lists
# @return {ListNode}
@numbers=[]
def merge_k_lists(lists)
    @numbers=[]
    lists.each do |li|
        visit_next(li)
    end
    @number = @numbers.sort
    @number
end

def visit_next(li)
    return if li.nil?
    
    @numbers.push(li.val)
    visit_next(li.next)
end