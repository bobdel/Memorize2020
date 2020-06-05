//
//  Cardify.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 6/4/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

import SwiftUI

/// A custom ViewModifier to convert a view into a card like view.
struct Cardify: AnimatableModifier {
    var rotation: Double

    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }

    var animatableData: Double { // conforms to AnimatableModifer and vends better name
        get { return rotation}
        set { rotation = newValue }
    }

    func body(content: Content) -> some View {
        ZStack {
            Group {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth )
                content // the view that is cardified
            }.opacity(isFaceUp ? 1 : 0)
            
            RoundedRectangle(cornerRadius: self.cornerRadius).fill().opacity(isFaceUp ? 0 : 1)

        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
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
