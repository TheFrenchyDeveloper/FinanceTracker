//
//  AccountList.swift
//  FinanceTracker
//
//  Created by KEVIN on 20/11/2022.
//

import Foundation

class AccountList: ObservableObject {
    
    @Published var accounts: [Account]
    
    init(accounts: [Account] = []) {
        self.accounts = accounts
    }
}


