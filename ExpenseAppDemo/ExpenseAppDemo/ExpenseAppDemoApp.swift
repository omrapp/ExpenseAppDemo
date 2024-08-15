//
//  ExpenseAppDemoApp.swift
//  ExpenseAppDemo
//
//  Created by Omar Ayed on 08/07/2024.
//

import SwiftUI
import SwiftData

@main
struct ExpenseAppDemoApp: App {
    
    let container: ModelContainer = {
        let scheme = Schema([Expense.self])
        return try! ModelContainer(for: scheme, configurations: [])
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(container)
        //.modelContainer(for: [Expense.self])
    }
}


