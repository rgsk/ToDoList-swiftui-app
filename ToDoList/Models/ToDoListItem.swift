//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdAt: TimeInterval
    var isComplete: Bool
    
    mutating func markComplete(_ value: Bool) {
        isComplete = value
    }
}
