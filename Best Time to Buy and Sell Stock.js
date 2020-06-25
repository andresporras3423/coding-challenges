/**
 * @param {number[]} prices
 * @return {number}
 */
var maxProfit = function(prices) {
  let max = 0;
  for(let i=0; i<prices.length-1; i++){
      for(let j=i+1; j<prices.length; j++){
          if(max<(prices[j]-prices[i])) max = prices[j]-prices[i];
      }
  }
  return max;
};