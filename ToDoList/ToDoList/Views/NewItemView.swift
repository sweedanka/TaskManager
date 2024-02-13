//
//  NewItemView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("Новое задание")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 20)
            Form {
                // Titile
                TextField("Название", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due date
                DatePicker("Дата", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .environment(\.locale, Locale.init(identifier: "ru"))
                
                Picker("Уровень важности", selection: $viewModel.itemPriority) {
                    Text("Очень низкий")
                        .tag("Очень низкий")
                    Text("Низкий")
                        .tag("Низкий")
                    Text("Средний")
                        .tag("Средний")
                    Text("Высокий")
                        .tag("Высокий")
                }
                    
                Picker("Тип задачи", selection: $viewModel.type) {
                    Text("ДЗ")
                        .tag("ДЗ")
                    Text("РК")
                        .tag("РК")
                    Text("ЛР")
                        .tag("ЛР")
                    Text("Другое")
                        .tag("Другое")
                }
                .pickerStyle(.segmented)



                // Button
                BLButton(
                    title: "Cохранить",
                    background: .blue)
                {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Ошибка!"), message: Text("Пожалуйста, заполните все поля и выберете дату познее вчерашнего дня."))
                }
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView(newItemPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
