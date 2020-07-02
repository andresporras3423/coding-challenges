/**
 * Initialize your data structure here.
 */
var MyHashMap = function() {
    this.list=[];
    for(let i=0;i<1000000; i++){
        this.list.push(-1);
    }
    this.hashCode = function(key){
        return key % 1000000;
    }
};

/**
 * value will always be non-negative. 
 * @param {number} key 
 * @param {number} value
 * @return {void}
 */


MyHashMap.prototype.put = function(key, value) {
    this.list[this.hashCode(key)]=value;
};

/**
 * Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key 
 * @param {number} key
 * @return {number}
 */
MyHashMap.prototype.get = function(key) {
    return this.list[this.hashCode(key)];
};

/**
 * Removes the mapping of the specified value key if this map contains a mapping for the key 
 * @param {number} key
 * @return {void}
 */
MyHashMap.prototype.remove = function(key) {
    this.list[this.hashCode(key)]=-1;
};

/** 
 * Your MyHashMap object will be instantiated and called as such:
 * var obj = new MyHashMap()
 * obj.put(key,value)
 * var param_2 = obj.get(key)
 * obj.remove(key)
 */