/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} n
 * @return {ListNode}
 */
let first= null;
let num = null;
let prev = null;
let after = null;
var removeNthFromEnd = function(head, n) {
    first = head;
    num=n;
    prev = null;
    after = head;
    go_next(head.next, 1);
    if(prev==null){
       head = head.next;
       }
    else{
        console.log(prev.val+" "+after.val);
        prev.next = after.next;
    }
    return head;
};

let go_next = function(head, number){
    if(head==null) return;
    if(number<num){
        number++;
    }
    else{
        prev = prev==null ? first : prev.next;
        after=after.next;
    }
    go_next(head.next, number);
}