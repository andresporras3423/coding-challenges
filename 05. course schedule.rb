# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  while prerequisites.length>0
      pre=[]
      post=[]
      prerequisites.each do |pr|
          pre.push(pr[0])
          post.push(pr[1])
      end
      pre = pre.uniq
      post = post.uniq
      no_pre = pre - post
      return false if no_pre.length==0
      prerequisites = prerequisites.select{|pr| pr unless no_pre.include?(pr[0])}
  end
  return true
end
