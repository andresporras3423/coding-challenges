# @param {Integer[][]} intervals
# @return {Integer}
def erase_overlap_intervals(intervals)
  intervals = merge_sort(intervals.map(&:clone))
  i=0
  j=1
  sol=0
  while j<intervals.length
      if intervals[i][1]>intervals[j][0]
          sol+=1
          if intervals[i][1]>intervals[j][1]
              i=j
          end
      else
          i=j
      end
      j+=1
  end
  sol
end

def merge_sort(intervals)
 inter1 = intervals[0...intervals.length/2]
 inter2 = intervals[intervals.length/2...intervals.length]
  if inter1.length>1
      inter1 = merge_sort(inter1.map(&:clone))
  end
  if inter2.length>1
      inter2 = merge_sort(inter2.map(&:clone))
  end
  sol = []
  (0...intervals.length).each do |i|
      if inter1.length>0 && (inter2.length==0 || inter1[0][0]<=inter2[0][0])
         sol.push(inter1[0].clone)
          inter1.delete_at(0)
      else
          sol.push(inter2[0].clone)
          inter2.delete_at(0)
      end
  end
  sol
end