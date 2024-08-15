//
//  ContentView.swift
//  ExpenseAppDemo
//
//  Created by Omar Ayed on 08/07/2024.
//

import SwiftUI
import SwiftData
import UIKit


struct ContentView: View {
    
    
    @Environment(\.modelContext) private var context
    
    @State private var isShowingItemSheet = false
    
    @State private var scale: CGFloat = 0.5
    
    @Query(sort: \Expense.date) var expenses: [Expense]
    
    @State private var expenseToEdit: Expense?
    
    var body: some View {
        
        NavigationStack {
            
            List {
                ForEach(expenses) { expense in
                    ExpenseCell(expense: expense)
                        .onTapGesture {
                            expenseToEdit = expense
                        }
                }
                .onDelete{ indexSet in
                    for index in indexSet {
                        context.delete(expenses[index])
                    }
                }
            }
            .navigationTitle("Expenses")
            .padding(.top, 10)
            .background(Color(UIColor.systemGroupedBackground))
            .sheet(isPresented: $isShowingItemSheet, content: {
                AddExpenseView()
            })
            .sheet(item: $expenseToEdit)  { expense in
                UpdateExpenseView(expense: expense)
            }
            .toolbar {
                if !expenses.isEmpty {
                    Button("Add Expense", systemImage: "plus") {
                        isShowingItemSheet = true
                    }
                }
            }
            .overlay {
                if expenses.isEmpty {
                    ContentUnavailableView(label:{
                        Label("No Expenses", systemImage: "list.bullet.rectangle.portrait")
                    }, description: {
                        Text("Start to add expenses to the List")
                    }, actions: {
                        Button("Add Expense") {
                            isShowingItemSheet = true
                        }
                    }).offset(y: -60)

                }
            }.overlay(content: {
                Circle()
                    .foregroundColor(.black)
                    .opacity(0.3)
                    .padding(20)
                    .offset(CGSize(width: 0, height: -50.0))
                    
            })
            .task {
                
            }
        }
        
    }
    
    
}





#Preview {
    ContentView()
}
