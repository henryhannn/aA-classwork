const arr = [2, 4, 3, 5]

Array.prototype.myEach = function(mult) {
    for(i=0 ; i < this.length; i++){
       mult(this[i]);
    }
    return this
}

const add_5 = function(num){
   return  (num + 5)
}

// console.log(arr.myEach(add_5))

Array.prototype.myMap = function(funk){
    let new_arr = []
    this.myEach(function(el){
        new_arr.push(funk(el));
    }
    )
    return new_arr
}


console.log(arr.myMap(add_5))