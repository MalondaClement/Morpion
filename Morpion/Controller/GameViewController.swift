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
		switch sender {
		case button00:
			game.update(zone: 00)
			break
		case button01:
			game.update(zone: 01)
			break
		case button02:
			game.update(zone: 02)
			break
		case button10:
			game.update(zone: 10)
			break
		case button11:
			game.update(zone: 11)
			break
		case button12:
			game.update(zone: 12)
			break
		case button20:
			game.update(zone: 20)
			break
		case button21:
			game.update(zone: 21)
			break
		case button22:
			game.update(zone: 22)
			break
		default:
			break
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

