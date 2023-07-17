//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//
import FirebaseFirestore
import Foundation


class ToDoListViewModel: ObservableObject {
    @Published var showCreateItemView = false;
    let userId: String
    init(userId: String) {
        self.userId = userId
    }
    func deleteTodoListItem(itemId: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
