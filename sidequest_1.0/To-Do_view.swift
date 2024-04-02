//
//  To-Do_view.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 04/01/2024.
//

import SwiftUI

struct ToDoTask: Identifiable, Codable { //for single item //protocole: swift knows each item will be unique in ForEach
    var id = UUID() //unique id for each task
    let name: String
    let deadline: Date
}

@Observable
class ToDoTasks { //array of items
    var itemsToDo = [ToDoTask]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(itemsToDo) {
                UserDefaults.standard.set(encoded, forKey: "ItemsToDo")
            }
        }
    }
    init() {
        if let savedItemsToDo = UserDefaults.standard.data(forKey: "ItemsToDo") {
            if let decodedItemsToDo = try? JSONDecoder().decode([ToDoTask].self, from: savedItemsToDo) {
                itemsToDo = decodedItemsToDo
                return
            }
        }
        itemsToDo = []
    }
}


struct To_Do_view: View {
    @State private var tasksToDo = ToDoTasks() //storing tasks,keeping object alive
    @State private var showingToDoAddView = false
    
    var body: some View {
        VStack{
            Text("to-do list")
                .font(.title)
                .bold()
                .foregroundColor(.purple)
                //.multilineTextAlignment(.leading)
            List {
                ForEach(tasksToDo.itemsToDo) { item in
                    VStack {
                        Text(item.name)
                            .font(.headline)
                        
                        //Text(item.deadline)
                    }
                }
                .onDelete(perform: removeTasks)
            }
            .toolbar {
                Button ("Add task", systemImage: "plus") {
                    showingToDoAddView = true
                }
            }
            .sheet(isPresented: $showingToDoAddView) {
                To_Do_addview(tasksToDo: tasksToDo)
            }
        }
    }
    
    func removeTasks(at offsets: IndexSet) {
        tasksToDo.itemsToDo.remove(atOffsets: offsets)
    }
}

#Preview {
    To_Do_view()
}
