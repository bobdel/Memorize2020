//
//  Cardify.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 6/4/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

import SwiftUI

/// A custom ViewModifier to convert a view into a card like view.
struct Cardify: ViewModifier {
    var isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth )
                content // the view that is cardified
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill()
            }
        }
    }

     // MARK: - Drawing Constants

    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

// make this modifier into a nice call site
extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
