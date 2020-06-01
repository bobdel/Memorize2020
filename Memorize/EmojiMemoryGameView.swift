//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/26/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

// MVVM View (init by SceneDelegate)

import SwiftUI

struct EmojiMemoryGameView: View {
    // get a reference to the view model component (note its a pointer)
    // that was initialized in the scene delegate.
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chooseCard(card: card) // trigger the intent
                }.aspectRatio(0.66, contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth:3)
                    Text(self.card.content)
                } else {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75 ))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
