//
//  StatisticsViewViewModel.swift
//  ToDoList
//
//  Created by Danil Kim on 17.11.2023.
//

import Foundation

import FirebaseAuth
import FirebaseFirestore

class StatisticsViewViewModel: ObservableObject {
    
    @Published var inTime: Int = 0
    @Published var notInTime: Int = 0
    @Published var total: Int = 0
    
    @Published var DZ: Int = 0
    @Published var RK: Int = 0
    @Published var LR: Int = 0
    @Published var Drugoe: Int = 0
    
    @Published var Statistic: [Statistics] = []
    
    private let userId: String
    
    func count(items: [ToDoListItem]) {
        self.total = 0
        self.inTime = 0
        self.notInTime = 0
        Statistic = []
        self.DZ = 0
        self.RK = 0
        self.LR = 0
        self.Drugoe = 0
        for item in items {
            if item.inTime {
                self.inTime += 1
            }
            if !item.inTime && item.isDone {
                self.notInTime += 1
            }
            if item.type == "ДЗ" {
                self.DZ += 1
            }
            if item.type == "РК" {
                self.RK += 1
            }
            if item.type == "ЛР" {
                self.LR += 1
            }
            if item.type == "Другое" {
                self.Drugoe += 1
            }
        }
        self.total = items.count
        Statistic.append(Statistics(amount: self.DZ, type: "ДЗ"))
        Statistic.append(Statistics(amount: self.RK, type: "РК"))
        Statistic.append(Statistics(amount: self.LR, type: "ЛР"))
        Statistic.append(Statistics(amount: self.Drugoe, type: "Другое"))
    }
    
    init(userId: String) {
        self.userId = userId
    }
    
}
