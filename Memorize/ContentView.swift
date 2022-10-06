//
//  ContentView.swift
//  Memorize
//
//  Created by Mahmut Baran Türkmen on 04/10/2022.
//

import SwiftUI

struct ContentView: View {
    // Array<String>
    // [String]
    // but swift can infer it
    var emojis = ["🚅", "🚇", "🚌", "🚒", "🚕", "🚗", "🚚", "🛺", "⛵", "🚢", "🛩️", "🚁", "🚠", "🛸", "🚲"]
    var emojiCount = 3
    
    var body: some View {
        HStack {
            ForEach(emojis[0..<emojiCount], id: \.self, content:{ emoji in
                CardView(content: emoji)
            })
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)

    }
}

struct CardView: View {
    // Variables must have value in swift
    // @State makes it a pointer  xrx
    @State var isFaceUp: Bool = true
    // To read the docs, hold down the `option` key and select `String`
    var content: String
    
    var body: some View {
        // ZStack: A view that overlays its subviews, aligning them in both axes
        ZStack {
            // Swift "inferrs" the type meaning that Swift looks at the content
            // and puts the type
            // let shape: RoundedRectangle = RoundedRectangle(...)
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            } else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
            // all `View`s in SwiftUI are immutable (cannot be modified)
            // -> new `View`s are constantly beng rebuilt when a `View` is changed
            isFaceUp = !isFaceUp
        }
    }
}























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
