//
//  MainViewModel.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation
import FirebaseAuth

class MainViewModel: ObservableObject {
    @Published var currentUserId = ""
    
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener {
            [weak self] _, user in
            DispatchQueue.main.async {
                // we wrapped with DispatchQueue.main.async we want to show updates in the main thread
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
