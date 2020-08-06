import React from 'react';

export default class Tile extends React.Component {
    constructor(props) {
        super(props);
        //this.state = { tileClass: 'unexplored', text: '\u2b1c'};
        this.handleClick = this.handleClick.bind(this);
    }

    handleClick(e) { 
        e.preventDefault();
        const flagged = e.altKey? true: false;
        this.props.updateGame(this.props.tile, flagged);
    }

    render() {
        let text;
        let tileClass;
        if (this.props.tile.explored) {
            if (this.props.tile.bombed) {
                text = '\ud83d\udca3';
                tileClass = "bombed";
            } else {
                text = this.props.tile.adjacentBombCount();
                tileClass = "revealed";
            }
        } else if (this.props.tile.flagged) {
            text = "\ud83d\udea9";
            tileClass = "flagged";
        } else {
            text = '\u2b1c';
            tileClass = "unexplored";
        }
        
        return (
            <div className={tileClass} onClick={this.handleClick}>{text}</div> 
        )
    }
}