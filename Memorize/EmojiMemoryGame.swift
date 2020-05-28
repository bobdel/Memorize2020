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
    // private(set) allows objects to "see" the model directly,
    // but only EmojiMemoryGame can modify the model. It is a glass door.
    private(set) var model: MemoryGame<String>

    // MARK: -  Intent(s)
    // functions that allow views to access the model. Essentially openings in the glass door.

    func chooseCard(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
