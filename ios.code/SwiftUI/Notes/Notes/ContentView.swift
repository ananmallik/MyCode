//
//  ContentView.swift
//  Notes
//
//  Created by A. Mallik on 19/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var text: Array<String> = []
    @State var showsheet = false
    @State var textitemtemp = ""
    
    var body: some View {
        NavigationView {
            Group {
                if text.count <= 1 {
                    Text("No item")
                } else {
                    List((1...text.count-1), id: \.self){ i in
                        Text(text[i])
                    }
                }
            }
            .navigationTitle("Notes")
            .toolbar {
                Button(action: {
                    showsheet.toggle()
                    textitemtemp = ""
                }, label: {
                    Image(systemName: "plus")
                })
            }
            
            .onChange(of: text) { _ in
  
            }
        }
        
        .sheet(isPresented: $showsheet){
            NavigationView {
                List {
                    TextField("item", text: $textitemtemp)
                }
                    .navigationTitle("Add an item")
                .toolbar {
                    Button("add"){
                        text.append(textitemtemp)
                        showsheet.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
