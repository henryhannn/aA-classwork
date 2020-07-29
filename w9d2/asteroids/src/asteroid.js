const MovingObject = require("./moving_object");
const Util = require("./util");

const DEFAULTS = {
    COLOR: "#33AD25",
    RADIUS: 8
}

function Asteroid(options) {
    options.pos = options.pos ; //random position
    options.vel = options.vel || Util.randomVec(2);
    options.color = DEFAULTS.COLOR;
    options.radius = DEFAULTS.RADIUS;

    MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;