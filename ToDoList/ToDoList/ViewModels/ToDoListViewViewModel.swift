//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView =  false

    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
    
    func isToday(item: ToDoListItem) -> Bool {
        guard item.dueDate >= Date().addingTimeInterval(-43200).timeIntervalSince1970 && item.dueDate <= Date().addingTimeInterval(43200).timeIntervalSince1970 else {
            return false
        }
        return true
    }
    
}
