//
//  MemoryGame.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/27/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

// MVVM Model (init by ViewModel)

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>

    mutating func choose(card: Card) {
        print("Card Chosen: \(card)")
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
    }

    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // bogus! TODO: Fix this
    }

    // MARK: - Initializer

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }

    // MARK: - Individual Card

    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

