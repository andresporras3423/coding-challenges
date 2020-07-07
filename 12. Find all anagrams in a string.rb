# @param {String} s
# @param {String} p
# @return {Integer[]}
def find_anagrams(s, p)
    pArray = p.split("")
    sArray = s.split("")
    pLength=pArray.length
    chars = Hash.new
    subString=Hash.new
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    alphabet.split("").each do |a| 
        chars[a]=0
        subString[a]=0
    end
    pArray.each{|p| chars[p]+=1}
    sol=[]
    sArray.each_with_index do |s0, i|
        
       if(i<pLength)
           subString[s0]+=1
       else
           sol.push(i-pLength) if same_hash(chars, subString)  
           subString[sArray[i-pLength]]-=1
           subString[s0]+=1
       end
    end
    sol.push(sArray.length-pLength) if same_hash(chars, subString)
    sol
end

def same_hash(chars, subString)
    #p chars
    #p subString
    chars.each_key do |key|
        if chars[key]!=subString[key]
            return false
        end
    end
    return true
end