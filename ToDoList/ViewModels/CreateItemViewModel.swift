//
//  CreateItemView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation

class CreateItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    init() {
        
    }
    func save() {
        
    }
}
