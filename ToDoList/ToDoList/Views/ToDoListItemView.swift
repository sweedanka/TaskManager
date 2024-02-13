//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    
    var body: some View {
        HStack {
            Button {
                viewModel.toggleIsDone(item: item)
                
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            if item.itemPriority == "Низкий" {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.red)
                Image(systemName: "star")
                    .foregroundColor(Color.red)
                Image(systemName: "star")
                    .foregroundColor(Color.red)
            }
            if item.itemPriority == "Средний" {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.red)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.red)
                Image(systemName: "star")
                    .foregroundColor(Color.red)
            }
            if item.itemPriority == "Высокий" {
                Image(systemName: "star.fill")
                    .foregroundColor(Color.red)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.red)
                Image(systemName: "star.fill")
                    .foregroundColor(Color.red)
            }
            
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: ToDoListItem(
            id: "123",
            title: "To do assignment",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false,
            inTime: false,
            itemPriority: "Низский",
            type: "ДЗ"))
    }
}
