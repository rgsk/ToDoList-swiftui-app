//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ToDoListItemViewModel: ObservableObject {
    init() {
        
    }
    
    func toggleIsComplete(item: ToDoListItem) {
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        var itemCopy = item
        itemCopy.isComplete = !item.isComplete
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
