//
//  ConcetrationGame.swift
//  StanfordOne
//
//  Created by Artyom on 18.08.2021.
//

import Foundation

class ConcentrationGame {
	var cards = [Card]()

	var faceUpCardIndex: Int?
	func choiceCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchingIndex = faceUpCardIndex, matchingIndex != index {
				if cards[matchingIndex].identifier == cards[index].identifier {
					cards[matchingIndex].isMatched = true
					cards[index].isMatched = true
				}
				cards[index].isFaceUp = true
				faceUpCardIndex = nil
			} else {
				for flipDown in cards.indices {
					cards[flipDown].isFaceUp = false
				}
				cards[index].isFaceUp = true
				faceUpCardIndex = index
			}
		}
	}
	
	func reset() {
		for i in cards.indices {
			cards[i].isFaceUp = false
			cards[i].isMatched = false
		}
	}
	
	init(countPairedCard: Int) {
		for _  in 1...countPairedCard {
			let card = Card()
			cards += [card, card]
		}
		cards = cards.shuffled()
	}
	
	
	
	
	
	
}
