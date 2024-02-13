//
//  ContentView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            // signed in
           accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Дом", systemImage: "house")
                }
            TodayToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Сегодня", systemImage: "calendar")
                }
            StatisticsView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Статистика", systemImage: "star.fill.left")
                }
            ProfileView()
                .tabItem {
                    Label("Профиль", systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
