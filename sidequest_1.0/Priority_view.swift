//
//  Priority_view.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 07/01/2024.
//

import SwiftUI

struct PriorityTask: Identifiable, Codable { //for single item //protocole: swift knows each item will be unique in ForEach
    var id = UUID() //unique id for each task
    let name: String
    
}

@Observable
class PriorityTasks { //array of items
    var itemsPriority = [PriorityTask]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsPriority) {
                UserDefaults.standard.set(encoded, forKey: "ItemsPriority")
            }
        }
    }
    init() {
        if let savedItemsPriority = UserDefaults.standard.data(forKey: "ItemsPriority") {
            if let decodedItemsPriority = try? JSONDecoder().decode([PriorityTask].self, from: savedItemsPriority) {
                itemsPriority = decodedItemsPriority
                return
            }
        }
        itemsPriority = []
    }
}

struct Priority_view: View {
    var body: some View {
        NavigationStack{
            Spacer();Spacer();Spacer();Spacer();Spacer()
            Text("priority of today")
                .font(.title)
                .bold()
                .foregroundColor(.indigo)
            //.multilineTextAlignment(.leading)
            
            List{
                
            }
        }
    }
}

#Preview {
    Priority_view()
}
