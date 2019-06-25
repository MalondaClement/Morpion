//
//  Game.swift
//  Morpion
//
//  Created by Clément Malonda on 25/06/2019.
//  Copyright © 2019 Clément Malonda. All rights reserved.
//

import Foundation

class Game {
	var grid: [[Character]] = [[" ", " ", " "],[" ", " ", " "],[" ", " ", " "]]
	var currentPlayer: CurrentPlayer = .playerX
	var state: State = .ongoing
	
	enum CurrentPlayer{
		case playerX, playerO
	}
	enum State {
		case ongoing, over
	}
	
	private func changePlayer(){
		switch currentPlayer {
		case .playerX:
			currentPlayer = .playerO
			break
		case .playerO:
			currentPlayer = .playerX
			break
		}
	}
	private func finishGame(){
		state = .over
	}
}
