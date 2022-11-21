//
//  Transaction.swift
//  FinanceTracker
//
//  Created by KEVIN on 21/11/2022.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let label: String
    let amount: Float
    let currency: Currency
    let date: Date
}
