//
//  vaidations.swift
//  ToDoList
//
//  Created by Rahul Gupta on 17/07/23.
//

import Foundation

func isValidFullName(_ fullName: String) -> String? {
    if fullName.trimmingCharacters(in: .whitespaces).isEmpty {
        return "Full Name is Required"
    }
    return nil
}


func isValidPassword(_ password: String, register: Bool) -> String? {
    if password.trimmingCharacters(in: .whitespaces).isEmpty {
        return "Password is Required"
    }
    if register {
        let PASSWORD_MIN_LENGTH = 6
        if password.count < PASSWORD_MIN_LENGTH {
            return "Password should be atleast \(PASSWORD_MIN_LENGTH) characters"
        }
    }
    return nil
}


func isValidEmail(_ email: String) -> String? {
    if email.trimmingCharacters(in: .whitespaces).isEmpty {
        return "Email is Required"
    }
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    if !emailPredicate.evaluate(with: email) {
        return "Please enter a valid Email"
    }
    return nil
}
