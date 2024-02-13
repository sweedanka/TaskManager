//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
