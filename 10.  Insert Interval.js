/**
 * @param {number[][]} intervals
 * @param {number[]} newInterval
 * @return {number[][]}
 */
var insert = function(intervals, newInterval) {
  for(let i=0; i<intervals.length; i++){
      if(intervals[i][0] >newInterval[1]){
        return intervals.slice(0, i).concat([newInterval]).concat(intervals.slice(i, intervals.length));
      }
      else if(newInterval[1]>=intervals[i][0] && newInterval[0]<=intervals[i][1]){
              newInterval = [Math.min(intervals[i][0], newInterval[0]),           Math.max(intervals[i][1], newInterval[1])];
          intervals.splice(i,1);
          i--;
              }
  }
  return intervals.concat([newInterval]);
};