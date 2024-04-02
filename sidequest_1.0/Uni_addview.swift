//
//  Uni_addview.swift
//  sidequest_1.0
//
//  Created by Denisa Kršková on 07/01/2024.
//

import SwiftUI

struct Uni_addview: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var deadline = Date.now
    
    var tasksUni: UniTasks
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                
                DatePicker("Choose a deadline", selection: $deadline, in:Date.now...)
                    .labelsHidden()
                    
            }
            .navigationTitle("Add new task")
            .toolbar {
                Button("Save") {
                    let itemUni = UniTask(name: name, deadline: deadline)
                    tasksUni.itemsUni.append(itemUni)
                    dismiss()
                }
            }
        }
    }
}
#Preview {
    Uni_addview(tasksUni: UniTasks())
}
