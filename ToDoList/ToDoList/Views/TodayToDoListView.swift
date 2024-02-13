//
//  TodayToDoListView.swift
//  ToDoList
//
//  Created by Danil Kim on 30.12.2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodayToDoListView: View {
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
                        if viewModel.isToday(item: item) {
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
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                Spacer()
            }
            .background(Image("Wallpaper3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            .navigationTitle("Cегодня")
            
        }
    }
}

struct TodayToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodayToDoListView(userId: "c3cbYWGbdxbo9U3La9RkScUCG9t2")
    }
}
