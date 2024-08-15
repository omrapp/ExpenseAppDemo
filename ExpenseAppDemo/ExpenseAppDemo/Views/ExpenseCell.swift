//
//  ExpenseCell.swift
//  ExpenseAppDemo
//
//  Created by Omar Ayed on 08/07/2024.
//

import SwiftUI

struct ExpenseCell: View {
    
    let expense: Expense
    
    var body: some View {
        
        HStack {
            Text(expense.name).frame(alignment: .leading)
            Spacer()
            Text(expense.date, format: .dateTime.day().month().year())
            Spacer()
            Text(expense.value, format: .currency(code: "USD"))
        }
    }
}
