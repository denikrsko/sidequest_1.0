//
//  To-Do_editview.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 16/01/2024.
//

import SwiftUI

struct To_Do_editview: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var deadline = Date.now
    @State private var id = ""
    
    var tasksToDo: ToDoTasks
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                
                DatePicker("Choose a deadline", selection: $deadline, in:Date.now...)
                    .labelsHidden()
                    
            }
            .navigationTitle("Edit task")
            .toolbar {
                Button("Save") {
                    let itemToDo = ToDoTask(name: name, deadline: deadline)
                    tasksToDo.itemsToDo.append(itemToDo)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    To_Do_editview(tasksToDo: ToDoTasks())
}
