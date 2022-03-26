//
//  Card.swift
//  Concentration
//
//  Created by Chenjun Ren on 2021-05-31.
//

import Foundation

struct Card: Hashable {
    var isFaceUp = false
    var isMatched = false
    private let identifier: Int
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier() -> Int {
        defer { identifierFactory += 1 }
        return identifierFactory
    }
    
    init() {
        identifier = Self.getUniqueIdentifier()
    }
}
