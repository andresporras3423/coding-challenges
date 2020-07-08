/**
 * Definition for a binary tree node.
 * function TreeNode(val, left, right) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.left = (left===undefined ? null : left)
 *     this.right = (right===undefined ? null : right)
 * }
 */
/**
 * @param {TreeNode} root
 * @param {number} k
 * @return {number}
 */
let vals = [];
let size=0;
var kthSmallest = function(root, k) {
    vals = [];
    size=k;
    dsf(root);
    return vals[k-1];
};

let dsf = function(root){
    if(vals.length==size) return;
    if(root==null) return;
    dsf(root.left);
    vals.push(root.val);
    dsf(root.right);
}