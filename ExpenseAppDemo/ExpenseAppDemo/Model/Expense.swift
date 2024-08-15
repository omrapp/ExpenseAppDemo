//
//  Expense.swift
//  ExpenseAppDemo
//
//  Created by Omar Ayed on 08/07/2024.
//

import Foundation
import SwiftData

@Model
class Expense : ObservableObject {
    
    @Attribute(.unique) var id = UUID()
    
    var name: String
    var date: Date
    var value: Double
    var details: String?
    
    init(name: String, date: Date, value: Double, details: String? = nil) {
        self.name = name
        self.date = date
        self.value = value
        self.details = details
    }
}
