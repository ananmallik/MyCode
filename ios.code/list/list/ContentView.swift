//
//  ContentView.swift
//  list
//
//  Created by A. Mallik on 30/07/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        List {
            ForEach([2, 4, 6, 8,  10], id: \.self) {
                Text("\($0) is even")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
