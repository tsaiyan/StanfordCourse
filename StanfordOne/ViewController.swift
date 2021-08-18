//
//  ViewController.swift
//  StanfordOne
//
//  Created by Artyom on 18.08.2021.
//

import UIKit

class ViewController: UIViewController {

	
	
	lazy var game = ConcentrationGame(countPairedCard: buttonCollection.count / 2)
	
	var emojiCollection = ["🐶", "🦑", "🦄", "🦆", "🐘", "🐝", "🦞", "🐳", "🐏"]
	
	var emojiDictionary = [Int:String]()
	func emojiIdentifier(for card: Card) -> String {
		if emojiDictionary[card.identifier] == nil {
			let randomIndex = Int(arc4random_uniform(UInt32(emojiCollection.count)))
				emojiDictionary[card.identifier] = emojiCollection.remove(at: randomIndex)
		}
		return emojiDictionary[card.identifier] ?? "?"
	}
	
	
	func updateViewFromModel() {
		for index in buttonCollection.indices {
			let button = buttonCollection[index]
			let card = game.cards[index]
			if card.isFaceUp {
				button.setTitle(emojiIdentifier(for: card), for: .normal)
				button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			} else {
				button.setTitle("", for: .normal)
				button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0, green: 0.4790502191, blue: 0.9205970764, alpha: 1)
			}
		}
	}

	// MARK: - IBAction
	@IBAction func buttonAction(_ sender: UIButton) {
		if let buttonIndex = buttonCollection.firstIndex(of: sender) {
			game.choiceCard(at: buttonIndex)
			updateViewFromModel()
		}
	}
	@IBAction func resetButton(_ sender: UIButton) {
		for element in buttonCollection {
			element.isHidden = false
			element.setTitle("", for: .normal)
			element.backgroundColor =  #colorLiteral(red: 0, green: 0.4790502191, blue: 0.9205970764, alpha: 1)
		}
		emojiCollection = ["🐶", "🦑", "🦄", "🦆", "🐘", "🐝", "🦞", "🐳", "🐏"]
		game.reset()
		game = ConcentrationGame(countPairedCard: buttonCollection.count / 2)
	}

	// MARK: - IBOutlet
	@IBOutlet var buttonCollection: [UIButton]!

	
}

