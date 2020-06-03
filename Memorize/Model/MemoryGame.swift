//
//  MemoryGame.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/27/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

    // MARK: -  Model (init by ViewModel)

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    var cards: Array<Card> // the app's data

    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }

    // MARK: -  Play Game

    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched { // continue after 3 true conditional tests
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content { // cards match
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else { // do not match
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }

    // MARK: - Initializer

    // called by the ViewModel and assigned into a @published var named "model"
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
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}

