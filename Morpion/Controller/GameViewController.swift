//
//  GameViewController.swift
//  Morpion
//
//  Created by Clément Malonda on 25/06/2019.
//  Copyright © 2019 Clément Malonda. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
	
	@IBOutlet weak var button00: UIButton!
	@IBOutlet weak var button01: UIButton!
	@IBOutlet weak var button02: UIButton!
	@IBOutlet weak var button10: UIButton!
	@IBOutlet weak var button11: UIButton!
	@IBOutlet weak var button12: UIButton!
	@IBOutlet weak var button20: UIButton!
	@IBOutlet weak var button21: UIButton!
	@IBOutlet weak var button22: UIButton!
	@IBOutlet weak var newGameButton: UIButton!
	@IBOutlet weak var label: UILabel!
	var game = Game()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		for button in [button00, button01, button02, button10, button11, button12, button20, button21, button22]{
			button?.layer.cornerRadius = 15 //idée à revoir
		}
		startNewGame()
	}
	
	@IBAction func didTapeNewGameButton() {
		startNewGame()
	}
	
	@IBAction func didTapeOnGrid(_ sender: UIButton){
		sender.isEnabled = false
		update(sender)
		label.text = "\(game.currentPlayer) à vous de jouer"
		if game.currentPlayer == .X{
			sender.setTitle("X", for: .normal)
			victoryDetection()
			game.currentPlayer = .O
		}else{
			sender.setTitle("O", for: .normal)
			victoryDetection()
			game.currentPlayer = .X
		}
	}

	private func update(_ sender: UIButton){
		var button = [[button00, button01, button02], [button10, button11, button12], [button20, button21, button22]]
		for i in 0...2{
			for j in 0...2{
				if sender == button[i][j]{
					game.update(zone: 10*i+j)
				}
			}
		}
	}
	
	private func victoryDetection(){
		if game.victoryDetection(){
			game.state = .over
			label.text = "\(game.currentPlayer) gagne"
			for button in [button00, button01, button02, button10, button11, button12, button20, button21, button22]{
				button?.isEnabled = false
			}
		}
	}
	
	private func startNewGame(){
		game.refresh()
		for button in [button00, button01, button02, button10, button11, button12, button20, button21, button22] {
			button?.isEnabled = true
			button?.setTitle(" ", for: .normal)
		}
		label.text = "\(game.currentPlayer) à vous de jouer"
	}
}

