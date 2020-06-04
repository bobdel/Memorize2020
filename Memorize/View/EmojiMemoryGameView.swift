//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/26/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

    // MARK: -  View (init by SceneDelegate)

import SwiftUI

struct EmojiMemoryGameView: View {
    // get a reference to the view model component (note its a pointer)
    // that was initialized in the scene delegate.
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View { // main view
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.chooseCard(card: card) // trigger the intent
                }
                .padding(5)
            }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View { // individual card subview
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if self.card.isFaceUp {
                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth )
                    Pie(startAngle: (Angle.degrees(0-90)), endAngle: Angle.degrees(110-90), isClockwise: true)
                        .padding(5).opacity(0.40)
                    Text(self.card.content)
                } else {
                    if !self.card.isMatched {
                        RoundedRectangle(cornerRadius: self.cornerRadius).fill()
                    }
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * self.fontScaleFactor ))
        }
    }

    // MARK: - Drawing Constants

   private let cornerRadius: CGFloat = 10.0
   private let edgeLineWidth: CGFloat = 3
   private let fontScaleFactor: CGFloat = 0.7

}

struct ContentView_Previews: PreviewProvider { // Preview Generator

    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
