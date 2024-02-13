//
//  StatisticsView.swift
//  ToDoList
//
//  Created by Danil Kim on 17.11.2023.
//

import SwiftUI
import FirebaseFirestoreSwift
import Charts

struct StatisticsView: View {
    @FirestoreQuery var items: [ToDoListItem]
    @StateObject var viewModel: StatisticsViewViewModel
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(
            wrappedValue: StatisticsViewViewModel(userId: userId))
    }
    var body: some View {
        NavigationStack {
                VStack {
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 300, height: 60)
                                .foregroundColor(.gray.opacity(0.8))
                            Text("Всего задач:")
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 50, height: 60)
                                .foregroundColor(.gray.opacity(0.8))
                            Text("\(viewModel.total)")
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    }
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 300, height: 60)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            Text("Выполненных в срок задач:")
                                .bold()
                                .foregroundStyle(Color.black)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 50, height: 60)
                                .foregroundColor(.green.opacity(0.8))
                            Text("\(viewModel.inTime)")
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    }
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 300, height: 60)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 5, x: 5, y: 5)
                            Text("Выполненных не в срок задач:")
                                .bold()
                                .foregroundStyle(Color.black)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 12)
                                .frame(width: 50, height: 60)
                                .foregroundColor(.red.opacity(0.8))
                            Text("\(viewModel.notInTime)")
                                .bold()
                                .foregroundStyle(Color.white)
                        }
                    }
                    Chart {
                        ForEach(viewModel.Statistic) { item in
                            BarMark(
                                x: .value("Type", item.type),
                                y: .value("Amount", item.amount)
                            )
                            .foregroundStyle(by:  .value("Type", item.type))
                        }
                    }
                    .frame(height: 200)
                    .padding()
            }
            .background(Image("Wallpaper3")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
            .onAppear {
                viewModel.count(items: items)
            }
            .navigationTitle("Сегодня")
        }
    }
    
}

#Preview {
    StatisticsView(userId: "c3cbYWGbdxbo9U3La9RkScUCG9t2")
}
