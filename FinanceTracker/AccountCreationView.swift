//
//  AccountCreationView.swift
//  FinanceTracker
//
//  Created by KEVIN on 25/10/2022.
//

import SwiftUI

struct AccountCreationView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedCurrency: Currency = .euro
    @State private var amount: String = ""
    @State private var selectedIcon: String = "icon_001"
    @State private var accountName: String = ""
    var onAccountCreated: (Account) -> Void
    
    var body: some View {
        VStack(spacing: 32) {
            VStack {
                Text(accountName == "" ? "Nouveau compte" : accountName)
                    .font(.system(size: 32, weight: .bold))
                    .padding(.top, 32)
                Text("Solde: \(String(format: "%.2f", Float(amount) ?? 0.0))")
                    .font(.system(size: 20, weight: .light))
                    .foregroundColor(Color(white: 0.4))
            }
            VStack(alignment: .leading) {
                Text("Nom")
                    .font(.title2)
                    .bold()
                TextField("Ex : Paypal...", text: $accountName)
                    .submitLabel(.done)
                    .padding(12)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(.infinity)
            }
            VStack(alignment: .leading) {
                Text("Icône")
                    .font(.title2)
                    .bold()
                IconSelector(selectedIcon: $selectedIcon)
                    .padding(.horizontal, -16)
            }
            VStack(alignment: .leading) {
                Text("Solde initial")
                    .font(.title2)
                    .bold()
                HStack {
                    TextField("Ex : 200 \(selectedCurrency.rawValue)", text: $amount)
                        .padding(12)
                        .padding(.horizontal, 12)
                        .keyboardType(.numbersAndPunctuation)
                        .submitLabel(.done)
                    CurrencySelector(selectedCurrency: $selectedCurrency)
                        .foregroundColor(Color("purple"))
                        .padding(4)
                }
                .background(Color.white)
                .cornerRadius(.infinity)
            }
            Spacer()
            MainButton(title: "Créer") {
                let newAccount = Account(iconName: selectedIcon, name: accountName, initialAmount: Float(amount) ?? 0, transactions: [], currency: selectedCurrency)
                onAccountCreated(newAccount)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        .background(Color("grey"))
    }
}
    
    struct AccountCreationView_Previews: PreviewProvider {
        static var previews: some View {
            AccountCreationView { _ in
                return
            }
        }
    }
