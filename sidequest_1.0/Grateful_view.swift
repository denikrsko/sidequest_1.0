//
//  Grateful_view.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 07/01/2024.
//

import SwiftUI

struct GratefulTask: Identifiable, Codable { //for single item //protocole: swift knows each item will be unique in ForEach
    var id = UUID() //unique id for each task
    let name: String
    
}

@Observable
class GratefulTasks { //array of items
    var itemsGrateful = [GratefulTask]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsGrateful) {
                UserDefaults.standard.set(encoded, forKey: "ItemsGrateful")
            }
        }
    }
    init() {
        if let savedItemsGrateful = UserDefaults.standard.data(forKey: "ItemsGrateful") {
            if let decodedItemsGrateful = try? JSONDecoder().decode([GratefulTask].self, from: savedItemsGrateful) {
                itemsGrateful = decodedItemsGrateful
                return
            }
        }
        itemsGrateful = []
    }
}

struct Grateful_view: View {
    @State private var tasksGrateful = GratefulTasks() //storing tasks,keeping object alive
//    @State private var grateful1 = ""
//    @State private var grateful2 = ""
//    @State private var grateful3 = ""
    
    var body: some View {
        NavigationStack{
            Spacer();Spacer();Spacer();Spacer();Spacer()
            Text("3 things i am grateful for...")
                .font(.title)
                .bold()
                .foregroundColor(.orange)
                //.multilineTextAlignment(.leading)
            
            List{
                
            }

//            List {
//                TextField("first thing", text: $grateful1)
//                tasksGrateful.itemsGrateful.append(contentsOf:)
//                //textfieldArray.append(someTextField.text!)
//                TextField("second thing", text: $grateful2)
//                TextField("third thing", text: $grateful3)
//            }
            
            
//            List {
//                ForEach(tasksGrateful.itemsGrateful) { item in
//                    VStack {
//                        Text(item.name)
//                            .font(.headline)
//                    }
//                }
//                .onDelete(perform: removeTasks)
//            }
        }
    }
    
//    func removeTasks(at offsets: IndexSet) {
//        tasksGrateful.itemsGrateful.remove(atOffsets: offsets)
//    }
}


#Preview {
    Grateful_view()
}
