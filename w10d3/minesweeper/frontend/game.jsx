import React from 'react';
import Board from './board';
import * as Minesweeper from './../minesweeper'; 

class Game extends React.Component {
    constructor(props) {
        super(props);
        this.state = { board: new Minesweeper.Board(9, 9)};
        this.updateGame = this.updateGame.bind(this);
        this.restartGame = this.restartGame.bind(this);
    }

    updateGame(tile, flagged) {
        if (flagged) {
            tile.toggleFlag();
        } else {
            tile.explore();
        }
        this.setState({ board: this.state.board});
    }

    restartGame() {
        const board = new Minesweeper.Board(9, 9);
        this.setState({ board: board });
    }

    render() {
        let modal;
        // conditions
        // assign some <div> to the modal including <button onClick={this.restartGame}>

        if (this.state.board.lost() || this.state.board.won()) {
            const result = this.state.board.won() ? "You Have Won!!" : "You Have Lost!!"
            modal = 
                <div className="modal-screen">
                    <section className="modal-content" >   
                        <p>{result}</p>
                        <button onClick={this.restartGame}>Play Again</button>
                    </section>   
                </div>;
        }

        return (
            // {(this.state.board.lost() || this.state.board.won()) ? <button></button> : null}
            <div>
                {modal}
                <Board board={this.state.board} updateGame={this.updateGame} />
            </div>
        )
    }
}

export default Game;