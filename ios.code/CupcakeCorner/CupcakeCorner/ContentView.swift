//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by A. Mallik on 30/07/2024.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Text("Hello World")
                Text("Hello World")
            }
            .navigationBarTitle(Text("Cupcake Corner"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
