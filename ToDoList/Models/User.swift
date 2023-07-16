//
//  User.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import Foundation


struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
