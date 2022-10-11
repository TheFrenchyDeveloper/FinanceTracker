//
//  ContentView.swift
//  FinanceTracker
//
//  Created by KEVIN on 11/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            AccountCell(account:
                            Account(iconName: "icon_002", name: "Paypal", amount: 1234.56))
                        
            AccountCell(account:
                            Account(iconName: "icon_001", name: "Compte courant", amount: 124.56))
            
            AccountCell(account:
                            Account(iconName: "icon_003", name: "Transport", amount: 12))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
