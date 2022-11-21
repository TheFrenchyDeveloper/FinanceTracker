//
//  HomeView.swift
//  FinanceTracker
//
//  Created by KEVIN on 11/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isPresentingNewAccountScreen = false
    @StateObject private var accountList = AccountList()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("Solde total :")
                    Text("\(String(format: "%.2F", accountList.accounts.map { $0.initialAmount }.reduce(0, +))) €")
                        .font(.system(size: 32, weight: .bold))
                }
                .frame(maxWidth: .infinity)
                
                AccentButton(title: "+ account", color: Color("orange")) {
                    isPresentingNewAccountScreen = true
                }
                
                VStack(alignment: .leading) {
                    Text("Mes comptes")
                        .font(.title2)
                        .bold()
                    if previewAccounts.count > 0 {
                        VStack(spacing: 16) {
                            ForEach(accountList.accounts) { account in
                                AccountCell(account: account)
                            }
                        }
                    } else {
                        Text("Ajouter un compte")
                            .padding(32)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(24)
            }
        }
        .background(Color("grey"))
        .sheet(isPresented: $isPresentingNewAccountScreen) {
            AccountCreationView { newAccount in
                accountList.accounts.append(newAccount)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
