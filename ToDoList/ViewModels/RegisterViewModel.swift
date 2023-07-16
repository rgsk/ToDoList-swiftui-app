//
//  RegisterView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""

    init() {
        
    }
    
    func register() {
        print("register called")
        let errors = validate()
        if errors.count == 0 {
            errorMessage = ""
            Auth.auth().createUser(withEmail: email, password: password) {
                [weak self] result, error in
                guard let userId = result?.user.uid else {
                    return
                }
                
                // weak self ensures that only if instance of RegisterViewModel exists
                // only then call insertUserRecord function
                self?.insertUserRecord(id: userId)
            }
        } else {
            errorMessage = errors[0]
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> [String] {
        var errors: [String] = []
        if let fullNameError = isValidFullName(name) {
            errors.append(fullNameError)
        }
        
        if let emailError = isValidEmail(email) {
            errors.append(emailError)
        }
        if let passwordError = isValidPassword(password, register: true) {
            errors.append(passwordError)
        }
        
        return errors
    }
}
