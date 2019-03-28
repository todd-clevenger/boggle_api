import React from 'react';
import './Game.css';
import Board from './Board';

export default class Game extends React.Component {
	render() {
		return (
			<div id="boggle-container">
				<div id="board">
					<h2 id="center">
						Boggle Words
					</h2>
					<Board />
				</div>
				<div id="word-submit">
					<form>
						<label id="spaced" htmlFor="new-word">
              <strong>Current Word:</strong>
            </label>
						<input
							id="spaced"
						/>
    				<button id="spaced" type="button">Submit Word</button>
					</form>
				</div>
			</div>
		);
	}
}