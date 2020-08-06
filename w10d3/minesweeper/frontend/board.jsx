import React from 'react';
import Tile from './tile';

export default class Board extends React.Component {
    constructor(props) {
        super(props);
    }

    render() {
        return (
            <div>
                {this.props.board.grid.map((row, i) => {
                    return (
                        <div className="row" key={i}>
                            {row.map((tile, j) => {
                                return (
                                    <div className="tile">
                                        <Tile  tile={tile} updateGame={this.props.updateGame} key={i,j}/>
                                    </div>
                                )
                            })}
                        </div>
                    )
                })}
            </div>
        )
    }
}
