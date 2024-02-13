//
//  RegisterView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack {
            TextField("Имя", text: $viewModel.name)
                .padding()
                .background(Color.white.opacity(0.9))
                .textInputAutocapitalization(.never)
                .frame(width: 360, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            TextField("Почта", text: $viewModel.email)
                .padding()
                .background(Color.white.opacity(0.9))
                .frame(width: 360, height: 50)
                .textInputAutocapitalization(.never)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            SecureField("Пароль", text: $viewModel.password)
                .padding()
                .frame(width: 360, height: 50)
                .background(Color.white.opacity(0.9))
                .textInputAutocapitalization(.never)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Button(action: {
                viewModel.register()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 360, height: 50)
                        .foregroundColor(Color.purple)
                        .shadow(color: .black, radius: 5, x: 5, y: 5)
                    Text("Создать аккаунт")
                        .foregroundColor(.white)
                        .bold()
                }
            })
            
            Spacer()
            
        }
        .padding()
        .padding(.top, 300)
        .background(
            Image("Wallpaper2")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
        
//        VStack {
//
//            Form {
//                TextField("Имя", text: $viewModel.name)
//                    .autocorrectionDisabled()
//                TextField("Почта", text: $viewModel.email)
//                    .autocorrectionDisabled()
//                    .autocapitalization(.none)
//                SecureField("Пароль", text: $viewModel.password)
//                    .autocorrectionDisabled()
//                BLButton(
//                    title: "Создать аккаунт",
//                     background: .purple
//                ) {
//                    viewModel.register()
//                }
//            }
//            .offset(y: 300)
//            .scrollContentBackground(.hidden)
//            Spacer()
//        }
//        .background(
//                Image("Wallpaper2")
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                )
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
