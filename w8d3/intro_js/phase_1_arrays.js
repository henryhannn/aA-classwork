

Array.prototype.uniq = function(){
let new_arr = [];
    for(i=0; i < arr.length; i++) {
        if (!new_arr.includes(arr[i])){
            new_arr = new_arr.concat([arr[i]]);
        }
    }
    return new_arr;
}


// Array.prototype.twoSum = function() {
//     let new_arr = [];
//     for(i = 0; i < arr.length; i++) {
//         for(j = i + 1; j < arr.length; j++) {
//             if (arr[i] + arr[j] === 0) {
//                 new_arr.push([i, j]);
//             }
//         }
//     }
//     return new_arr;
// }

const arr = [[0, 2], [4, 3]];

Array.prototype.transpose = function (){
    let result = [];
    for(i =0; i < arr.length; i++){
        let new_arr = [];
        for(j = 0; j < arr[i].length; j++){
            new_arr.push(arr[j][i]);
        }
        result.push(new_arr);
    }
    return result;
}


console.log(arr.transpose())
