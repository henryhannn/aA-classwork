const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

window.MovingObject = MovingObject;
window.Asteroid = Asteroid;

window.addEventListener('DOMContentLoaded', (event) => {
    const canvas1 = document.getElementById("game-canvas");

    const ctx = canvas1.getContext("2d");
});