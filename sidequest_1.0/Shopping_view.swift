//
//  Shopping_view.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 07/01/2024.
//

import SwiftUI

struct ShoppingTask: Identifiable, Codable { //for single item //protocole: swift knows each item will be unique in ForEach
    var id = UUID() //unique id for each task
    let name: String
    
}

@Observable
class ShoppingTasks { //array of items
    var itemsShopping = [ShoppingTask]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsShopping) {
                UserDefaults.standard.set(encoded, forKey: "ItemsShopping")
            }
        }
    }
    init() {
        if let savedItemsShopping = UserDefaults.standard.data(forKey: "ItemsShopping") {
            if let decodedItemsShopping = try? JSONDecoder().decode([ShoppingTask].self, from: savedItemsShopping) {
                itemsShopping = decodedItemsShopping
                return
            }
        }
        itemsShopping = []
    }
}

struct Shopping_view: View {
    @State private var tasksShopping = ShoppingTasks() //storing tasks,keeping object alive
    @State private var showingShoppingAddView = false
    
    var body: some View {
        NavigationStack{
            Text("shopping list")
                .font(.title)
                .bold()
                .foregroundColor(.yellow)
                //.multilineTextAlignment(.leading)
            List {
                ForEach(tasksShopping.itemsShopping) { item in
                    VStack {
                        Text(item.name)
                            .font(.headline)
                    }
                }
                .onDelete(perform: removeTasks)
            }
            .toolbar {
                Button ("Add task", systemImage: "plus") {
                    showingShoppingAddView = true
                }
            }
            .sheet(isPresented: $showingShoppingAddView) {
                Shopping_addview(tasksShopping: tasksShopping)
            }
        }
    }
    
    func removeTasks(at offsets: IndexSet) {
        tasksShopping.itemsShopping.remove(atOffsets: offsets)
    }
}

#Preview {
    Shopping_view()
}
