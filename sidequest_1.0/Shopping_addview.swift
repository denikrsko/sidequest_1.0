//
//  Shopping_addview.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 07/01/2024.
//

import SwiftUI

struct Shopping_addview: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    
    var tasksShopping: ShoppingTasks
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                    
            }
            .navigationTitle("Add new item")
            .toolbar {
                Button("Save") {
                    let itemShopping = ShoppingTask(name: name)
                    tasksShopping.itemsShopping.append(itemShopping)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    Shopping_addview(tasksShopping: ShoppingTasks())
}
