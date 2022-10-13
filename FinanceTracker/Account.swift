//
//  Account.swift
//  FinanceTracker
//
//  Created by KEVIN on 11/10/2022.
//

import Foundation

struct Account: Identifiable {
    
    let id = UUID()
    let iconName: String
    let name: String
    let amount: Float
    
}
