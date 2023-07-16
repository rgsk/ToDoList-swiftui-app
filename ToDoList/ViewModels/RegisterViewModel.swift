//
//  RegisterView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {
        
    }
}
