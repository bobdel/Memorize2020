//
//  MemoryGame.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/27/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

// MVVM Component - This is the Model

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    func choose(card: Card) {
        print("Card Chosen: \(card)")
    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var contents: CardContent
    }
}

