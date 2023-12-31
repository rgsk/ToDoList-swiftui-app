//
//  LoginView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var loading = false
    
    init() {
        
    }
    func login() {
        let errors = validate()
        if errors.count == 0 {
            errorMessage = ""
            loading = true
            Auth.auth().signIn(withEmail: email, password: password) {
                [weak self] _, error in
                self?.loading = false
                if error != nil {
                    self?.errorMessage = error?.localizedDescription ?? ""
                }
            }
        } else {
            errorMessage = errors[0]
        }
    }
    private func validate() -> [String] {
        var errors: [String] = []
        if let emailError = isValidEmail(email) {
            errors.append(emailError)
        }
        if let passwordError = isValidPassword(password, register: false) {
            errors.append(passwordError)
        }
        
        return errors
    }
}

