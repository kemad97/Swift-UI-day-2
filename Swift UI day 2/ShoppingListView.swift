//
//  ShoppingListView.swift
//  Swift UI day 2
//
//  Created by Kerolos on 27/05/2025.
//

import SwiftUI

import SwiftUI

class ShoppingListViewModel : ObservableObject {
    @Published var itemsList : [String] = []
    @Published var newItem : String = ""
    
    func addItem () {
        if (!newItem.isEmpty){
            itemsList.append(newItem)
            newItem=""
        }
    }
}



