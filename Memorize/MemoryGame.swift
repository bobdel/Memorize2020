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

    // MARK: - Initializer

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, contents: content))
            cards.append(Card(isFaceUp: false, isMatched: false, contents: content))
        }
    }

    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var contents: CardContent
    }
}

