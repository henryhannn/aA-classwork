const Util = {
    inherits(childClass, parentClass) {
        childclass.prototype = Object.create(parentClass.prototype);
        childClass.prototype.constructor = childClass;
    }
};
  
module.exports = Util;