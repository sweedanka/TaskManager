//
//  ProfileView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Загрузка профиля...")
                        .font(.system(size: 30))
                }
            }
            .navigationTitle("Профиль")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // Info
        VStack(alignment: .leading) {
            HStack {
                Text("Имя:")
                    .bold()
                Text(user.name)
                    .padding()
            }
            HStack {
                Text("Почта:")
                    .bold()
                Text(user.email)
                    .padding()
            }
            HStack {
                Text("Дата рег.:")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    .padding()
            }
        }
        .padding()
        .background(
                Image("Wallpaper4")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
        
        
        // Sing Out
        Button("Выйти") {
            viewModel.logOut()
        }
        .tint(.purple)
        .padding()
        
        Spacer()
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
