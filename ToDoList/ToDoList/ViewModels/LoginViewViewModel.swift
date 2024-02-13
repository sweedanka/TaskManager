//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init() {
        
    }
    
    func checkUserExsists(email: String) async throws -> Bool {
        let db = Firestore.firestore()
        let documentSnapshot = db.collection("users").whereField("email", isEqualTo: email).count
        let count = try await documentSnapshot.getAggregation(source: .server).count
        return Int(truncating: count) > 0
    }
    
    func login() {
        guard validate() else {
            return
        }
        
        //try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Пожалуйства, заполните все поля."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Пожалуйста, введите почту правильно."
            return false
        }
        
        Task {
            guard try await checkUserExsists(email: email) else {
                errorMessage = "Неправильно введен логин или пароль."
                return false
            }
            return true
        }
        
        return true
    }
}
