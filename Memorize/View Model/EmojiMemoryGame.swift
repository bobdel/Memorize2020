//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/27/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

    // MARK: -  ViewModel (init by SceneDelegate)

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    // The paramaterized type tells the model that this game uses strings.
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "👹", "🧟"]
        return MemoryGame<String>(
            numberOfPairsOfCards: emojis.count - Int.random(in: 0..<3))
            { pairIndex in return emojis[pairIndex]
        }
    }

    // MARK: -  Access the Model

    // present the cards in a form easily readable by the view
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // Intent(s)

    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func resetGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
