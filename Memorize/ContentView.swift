//
//  ContentView.swift
//  Memorize
//
//  Created by Robert DeLaurentis on 5/26/20.
//  Copyright © 2020 Robert DeLaurentis. All rights reserved.
//

// MVVM Component - This is a View

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 4) { index in
                CardView(isFaceUp: true)
            }
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var isFaceUp: Bool

    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth:3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
