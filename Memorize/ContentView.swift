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
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content:{ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            emojiCount += 1
        } label: {
            Image(systemName: "plus.circle")
        }
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
                    .strokeBorder(lineWidth: 3)
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
