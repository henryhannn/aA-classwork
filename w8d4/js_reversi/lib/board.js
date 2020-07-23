let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = new Array(8);
  for (let i = 0; i < grid.length; i++) {
    grid[i] = new Array(8);
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");

  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] < 0 || pos[0] > 7) return false;
  if (pos[1] < 0 || pos[1] > 7) return false;
  return true;
};

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw Error('Not valid pos!');
  }
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  return (this.getPiece(pos)) && (this.getPiece(pos).color === color);
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.getPiece(pos)) {
    return true;
  }
  return false;
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns an empty array if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns empty array if it hits an empty position.
 *
 * Returns empty array if no pieces of the opposite color are found.
 */
Board.prototype._positionsToFlip = function(pos, color, dir, piecesToFlip){
  if (!piecesToFlip) {
    piecesToFlip = [];
  }

  let newPosition = [pos[0] + dir[0], pos[1] + dir[1]];
  
  if (!this.isValidPos(newPosition)) {
    return [];
  }
  if (!this.isOccupied(newPosition)) {
    return [];
  }
  if (this.isMine(newPosition, color)) {
    return piecesToFlip;
  } else {
    piecesToFlip.push(newPosition);
    return this._positionsToFlip(newPosition, color, dir, piecesToFlip);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }
  
  // debugger
  for(let i = 0; i < Board.DIRS.length; i++) {
    // The fourth arg for _positionsToFlip is implicitly applied from the original function.
    // We could also explicitly put in the "piecesToFlip" arg into _positionsToFlip.
    if (this._positionsToFlip(pos, color, Board.DIRS[i]).length > 0) {
      return true;
    }
  }

  return false;
};

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw Error("Invalid Move")
  }

  this.grid[pos[0]][pos[1]] = new Piece(color);

  for (let i = 0; i < Board.DIRS.length; i++) {
    let possibleFlips = this._positionsToFlip(pos, color, Board.DIRS[i]);
    for (let j = 0; j < possibleFlips.length; j++) {
      this.grid[possibleFlips[j][0]][possibleFlips[j][1]].flip();
    }
  }
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let movesList = [];
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i, j], color)) {
        movesList.push([i, j]);
      }
    }
  }
  return movesList;
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length > 0) {
    return true;
  }
  return false;
};



/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (this.hasMove("white") && this.hasMove("black")) {
    return false;
  }
  return true;
};




/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  for (let i = 0; i < this.grid.length; i++) {
    let printString = " " + i + " |";

    for (let j = 0; j < this.grid.length; j++) {
      let pos = [i, j]
      if (this.getPiece(pos)) {
        printString += ` ${this.getPiece(pos).toString()} `;
      } else {
        printString += " _ ";
      }
    }
    console.log(printString);
  }
};


module.exports = Board;
