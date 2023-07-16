//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//


import SwiftUI
import FirebaseCore



@main
struct ToDoListApp: App {
    // register app delegate for Firebase setup
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
