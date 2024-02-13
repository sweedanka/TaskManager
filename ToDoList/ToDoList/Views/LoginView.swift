//
//  LoginView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    let myColor = UIColor(
        red:200.0/255,
        green:145.0/255,
        blue:145.0/255,
        alpha:1.0)
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Почта", text: $viewModel.email)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .frame(width: 360, height: 50)
                    .textInputAutocapitalization(.never)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                SecureField("Пароль", text: $viewModel.password)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .frame(width: 360, height: 50)
                    .textInputAutocapitalization(.never)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Button(action: {
                    viewModel.login()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 360, height: 50)
                            .shadow(color: .black, radius: 5, x: 5, y: 5)
                        Text("Войти")
                            .foregroundColor(.white)
                            .bold()
                    }
                })
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Text("Нет аккаунта?")
                
                NavigationLink("Создать аккаунт", destination: RegisterView())
                    .foregroundColor(.white)
                
            }
            .padding()
            .padding(.top, 300)
            .background(
                Image("Wallpaper")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
        }
//        NavigationView {
//            VStack {
//
//                //Login Form
//                Form {
//                    if !viewModel.errorMessage.isEmpty {
//                        Text(viewModel.errorMessage)
//                    }
//                    TextField("Почта", text: $viewModel.email)
//                        .autocorrectionDisabled()
//                        .autocapitalization(.none)
//                    SecureField("Пароль", text: $viewModel.password)
//                        .autocorrectionDisabled()
//                   
//                    BLButton(
//                        title: "Войти",
//                        background: .blue
//                    ) {
//                        viewModel.login()
//                    }
//                }
//                .offset(y: 300)
//                .scrollContentBackground(.hidden)
//                
//                //Create Account
//                VStack {
//                    Text("Нет аккаунта?")
//                    
//                    NavigationLink("Создать аккаунт", destination: RegisterView())
//                        .foregroundColor(.white)
//                }
//                
//                Spacer()
//            }
//            .background(
//                    Image("Wallpaper")
//                        .resizable()
//                        .edgesIgnoringSafeArea(.all)
//                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                )
//        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0

    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}
