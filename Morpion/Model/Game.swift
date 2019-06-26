//
//  Game.swift
//  Morpion
//
//  Created by Clément Malonda on 25/06/2019.
//  Copyright © 2019 Clément Malonda. All rights reserved.
//

import Foundation

class Game {
	var grid: [[Character]] = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
	var currentPlayer: CurrentPlayer = .X
	var state: State = .ongoing
	
	enum CurrentPlayer{
		case X, O
	}
	enum State {
		case ongoing, over
	}
	
	private func changePlayer(){ //tjr utile ?
		switch currentPlayer {
		case .X:
			currentPlayer = .X
			break
		case .O:
			currentPlayer = .O
			break
		}
	}
	
	private func finishGame(){
		state = .over
	}
	
	func refresh(){
		grid = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]
		currentPlayer = .X
		state = .ongoing
	}
	
	func victoryDetection() -> Bool{
		for i in [0, 1, 2] {
			if grid[i][0] == grid[i][1] && grid[i][0] == grid[i][2] && grid[i][0] != " " {
				return true
			} else if grid[0][i] == grid[1][i] && grid[0][i] == grid[2][i] && grid[0][i] != " " {
				return true
			}
		}
		if grid[0][0] == grid[1][1] && grid[1][1] == grid[2][2] && grid[0][0] != " "{
			return true
		} else if grid[0][2] == grid[1][1] && grid[1][1] == grid[2][0] && grid[2][0] != " "{
			return true
		} else {
			return false
		}
	}
	
	func update(zone: Int){
		if currentPlayer == .X{
			grid[zone/10][zone%10] = "X"
		}else {
			grid[zone/10][zone%10] = "O"
		}
	}
}
