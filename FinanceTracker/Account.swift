//
//  Account.swift
//  FinanceTracker
//
//  Created by KEVIN on 11/10/2022.
//

import Foundation

class Account: Identifiable, ObservableObject {
    
    let id = UUID()
    let iconName: String
    let name: String
    let amount: Float
    
    init(iconName: String, name: String, amount: Float) {
        self.iconName = iconName
        self.name = name
        self.amount = amount
    }
    
}
