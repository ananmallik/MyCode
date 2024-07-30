//
//  ContentView.swift
//  emoji
//
//  Created by A. Mallik on 11/07/2024.
//

import SwiftUI


enum Emoji: String, CaseIterable {
    case 🌝, 🌺, 🐿,🧀, 🎄, 🍣
    case 🍰, 🤓, 🧃, coffee, 🍵
}

struct ContentView: View {
    
    @State var selection: Emoji = .🤓
    
    var body: some View {
        NavigationView {
        VStack {
            Text(selection.rawValue)
                .font(.system(size: 120))
                
            Picker("Select Emoji", selection: $selection){
                ForEach(Emoji.allCases, id: \.self) { emoji in
                    if(emoji.rawValue == "coffee") {
                        Text("☕️")
                            }
                    else {
                        Text(emoji.rawValue)
                        }
                    }
                }
            
            }
        .navigationTitle("Emoji Lovers!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
