//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/27/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

// MVVM Component - This is a ViewModel

import SwiftUI

class EmojiMemoryGame {
    // This is a handle to the model.
    // Explicit name used for instructional purposes. Better would be game or memoryGame.
    // The paramaterized type tells the model that this game uses strings.
    // private closes off objects to "see" the model directly
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "👹", "🧟"]
        return MemoryGame<String>(
            numberOfPairsOfCards: emojis.count - Int.random(in: 0..<3))
            { pairIndex in return emojis[pairIndex]
        }
    }

    // MARK: -  Access the Model

    // instead of using private(set) on this class, read the var
    // present the cards in a form more easily consumable by the view
    var cards: Array<MemoryGame<String>.Card> {
        model.cards.shuffled()
    }

    // MARK: -  Intent(s)
    // functions that allow views to access the model. Essentially openings in the glass door.

    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
