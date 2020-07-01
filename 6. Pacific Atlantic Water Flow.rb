#NOT SOLVED YET
# @param {Integer[][]} matrix
# @return {Integer[][]}
def pacific_atlantic(matrix)
  list_sol=[]
  matrix.each_with_index do |mat, i|
     mat.each_with_index do |m, j|
         #possible_sol = (i+1==matrix.length || matrix[i][j]>=matrix[i+1][j]) && (i-1==-1 || matrix[i][j]>=matrix[i-1][j]) && (j+1==matrix[0].length || matrix[i][j]>=matrix[i][j+1]) && (j-1==-1 || matrix[i][j]>=matrix[i][j-1])
         #p "#{possible_sol} #{i} #{j} #{matrix[i][j]}"
         if check_neighbors(i,j, matrix.map(&:clone))
             list_sol.push([i,j])
         end
     end
  end
  list_sol
end

def check_neighbors(i,j, matrix)
  return check_ocean_pac(i,j, matrix.map(&:clone)) && check_ocean_atl(i,j, matrix.map(&:clone))
end

def check_ocean_pac(i, j, matrix)
  return true if i-1==-1 || j-1==-1
  matrix[i][j]+=1
  sol1 =  i+1!=matrix.length && matrix[i][j]>matrix[i+1][j] ? check_ocean_pac(i+1, j, matrix.map(&:clone)) : false
  return sol1 if sol1
  sol2 = matrix[i][j]>matrix[i-1][j] ? check_ocean_pac(i-1, j, matrix.map(&:clone)) : false
  return sol2 if sol2
  sol3 = j+1!=matrix[0].length && matrix[i][j]>matrix[i][j+1] ? check_ocean_pac(i, j+1, matrix.map(&:clone)) : false
  return sol3 if sol3
  sol4 = matrix[i][j]>matrix[i][j-1] ? check_ocean_pac(i, j-1, matrix.map(&:clone)) : false
  return sol4 if sol4
  false
end

def check_ocean_atl(i, j, matrix)
  return true if i+1==matrix.length || j+1==matrix[0].length
  matrix[i][j]+=1
  sol1 = matrix[i][j]>matrix[i+1][j] ? check_ocean_atl(i+1, j, matrix.clone) : false
  return sol1 if sol1
  sol2 = i-1>=0 && matrix[i][j]>matrix[i-1][j] ? check_ocean_atl(i-1, j, matrix.clone) : false
  return sol2 if sol2
  #p "#{matrix[i][j]} #{matrix[i][j+1]}"
  sol3 = matrix[i][j]>matrix[i][j+1] ? check_ocean_atl(i, j+1, matrix.clone) : false
  return sol3 if sol3
  sol4 = j-1>=0 && matrix[i][j]>matrix[i][j-1] ? check_ocean_atl(i, j-1, matrix.clone) : false
  return sol4 if sol4
  false
end
