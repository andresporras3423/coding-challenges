# @param {Integer} n, a positive integer
# @return {Integer}
def hamming_weight(n)
  count = 0
  while n>0
      count+= n%2
      n = n/2
  end
  count
end
