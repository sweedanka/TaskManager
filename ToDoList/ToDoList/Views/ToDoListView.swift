//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))    }

    var body: some View {
        NavigationView {
            VStack {
                List() {
                    ForEach(items) { item in
                        ToDoListItemView(item: item)
                            .listRowBackground(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                                .background(Color.clear)
                                .foregroundColor(.white)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding(.bottom, 10)
                            )
                            .listRowSeparator(.hidden)
                            .swipeActions {
                                Button("Удалить"){
                                    viewModel.delete(id: item.id)
                                }
                                .tint(.red)
                            }
                            .padding(
                                EdgeInsets(
                                    top: 10,
                                    leading: 10,
                                    bottom: 20,
                                    trailing: 10
                                )
                            )
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                Spacer()
            }
            .background(Image("Wallpaper3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            .navigationTitle("Сделай!")
            .toolbar {
                    
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                            .frame(width: 50, height: 50)
                            .background(Color.white)
                            .cornerRadius(50)
                            .shadow(radius: 10)
                    }
                    .sheet(isPresented: $viewModel.showingNewItemView) {
                        NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    }
            }
            
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "c3cbYWGbdxbo9U3La9RkScUCG9t2")
    }
}
