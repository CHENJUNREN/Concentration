//
//  Concentration.swift
//  Concentration
//
//  Created by Chenjun Ren on 2021-05-31.
//

import Foundation

struct Concentration {
    private(set) var cards = [Card]()
    private(set) var flipCount = 0
    
    private var indexOfOneAndOnlyCardFaceUp: Int? {
        get {
            let faceUpIndices = cards.indices.filter { cards[$0].isFaceUp }
            return faceUpIndices.oneAndOnly
//            return faceUpIndices.count == 1 ? faceUpIndices.first : nil
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index), "index: \(index) out of range")
        if !cards[index].isMatched {
            if let matchedIndex = indexOfOneAndOnlyCardFaceUp, matchedIndex != index {
                // check if cards match
                if cards[matchedIndex] == cards[index] {
                    cards[matchedIndex].isMatched = true
                    cards[index].isMatched = true
                }
                // flip the card
                cards[index].isFaceUp = true
                flipCount += 1
            } else if indexOfOneAndOnlyCardFaceUp == nil {
                // either no cards or 2 cards are face up
                indexOfOneAndOnlyCardFaceUp = index
                flipCount += 1
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0, "number of pairs of cards must be > 0")
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // shuffle the cards
        cards.shuffle()
    }
}

extension Collection {
    var oneAndOnly: Element? {
        count == 1 ? first : nil
    }
}
