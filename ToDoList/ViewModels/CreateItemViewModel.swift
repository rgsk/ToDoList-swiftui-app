//
//  CreateItemView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    @Published var loading = false
    
    init() {
        
    }
    func save() {
        guard canSave else {
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = UUID().uuidString
        
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdAt: Date().timeIntervalSince1970,
            isComplete: false
        )
        
        let db = Firestore.firestore()
        loading = true
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()) {
                [weak self] _ in
                self?.loading = false
            }
    }
    var canSave: Bool {
        return !title.trimmingCharacters(in: .whitespaces).isEmpty
        && dueDate > Date()
    }
}
