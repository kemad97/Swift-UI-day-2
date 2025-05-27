//
//  ContentView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ShoppingListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Item", text: $viewModel.newItem)
                    .padding()
                
                List {
                    ForEach(viewModel.itemsList, id: \.self) { item in
                        Text(item)
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }.padding()
            }
            
            .navigationTitle("Shopping List")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Add") {
                        viewModel.addItem()
                    }
                }
            }
        }
    }
}
#Preview {
    ContentView()
}
