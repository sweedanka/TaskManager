//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import Foundation
import SwiftUI

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    var dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    var inTime: Bool
    let itemPriority: String
    let type: String
    
    mutating func setDone(_ state: Bool) {
        isDone = state
        if Date().timeIntervalSince1970 <= dueDate && isDone == true {
            inTime = true
        }
        else {
            inTime = false
        }
    }
}
