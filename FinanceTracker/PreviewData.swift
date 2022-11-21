//
//  PreviewData.swift
//  FinanceTracker
//
//  Created by KEVIN on 13/10/2022.
//

import Foundation

let previewAccounts = [
    Account(iconName: "icon_002", name: "Paypal", initialAmount: 1234.56, transactions: previewTransactions, currency: .euro),
    Account(iconName: "icon_001", name: "Compte courant", initialAmount: 124.56, transactions: previewTransactions, currency: .euro),
    Account(iconName: "icon_003", name: "Transport", initialAmount: 12, transactions: previewTransactions, currency: .euro)
]

let previewTransactions = [
    Transaction(label: "Repas du midi", amount: 8.54, currency: .euro, date: Date()),
    Transaction(label: "Tickets de métro", amount: 16.50, currency: .euro, date: Date()),
    Transaction(label: "Loyer", amount: 745, currency: .euro, date: Date())
]
