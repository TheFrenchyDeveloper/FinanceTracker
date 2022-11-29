//
//  NewTransactionView.swift
//  FinanceTracker
//
//  Created by KEVIN on 29/11/2022.
//

import SwiftUI

struct NewTransactionView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedAccountIndex = 0
    @State private var textFieldAmount = ""
    @State private var transactionName = ""
    @State private var transactionDate = Date()
    @EnvironmentObject var accountsList: AccountList
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Nouvelle transaction")
                .font(.system(size: 32, weight: .bold))
                .padding(.top, 32)
            HStack {
                TextField("0.00", text: $textFieldAmount)
                    .keyboardType(.numbersAndPunctuation)
                    .submitLabel(.done)
                    .foregroundColor(Color.black.opacity(0.4))
                    .font(.system(size: 48, weight: .semibold))
                    .frame(width: nil, height: nil, alignment: .trailing)
                    .multilineTextAlignment(.center)
                Text(accountsList.accounts[selectedAccountIndex].currency.rawValue)
                    .font(.system(size: 24, weight: .light))
            }
            VStack(spacing: 16) {
                AccountSelectorMenu(accountList: accountsList, selectedAccountIndex: $selectedAccountIndex) {
                // ...
                }
                TextField("Ex : Loyer...", text: $transactionName)
                    .submitLabel(.done)
                    .padding(12)
                    .padding(.horizontal, 12)
                    .background(Color.white)
                    .cornerRadius(.infinity)
                DatePicker("Date : ", selection: $transactionDate)
                    .padding(.leading, 24)
                    .padding(.trailing, 8)
            }
            Spacer()
            MainButton(title: "Ajouter") {
                let newTransaction = Transaction(
                    label: transactionName,
                    amount: Float(textFieldAmount) ?? 0.0,
                    currency: accountsList.accounts[selectedAccountIndex].currency,
                    date: transactionDate
                )
                
                // ajouter la transaction au compte

                accountsList.accounts[selectedAccountIndex].transactions.append(newTransaction)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("grey"))
    }
}

struct NewTransactionView_Previews: PreviewProvider {
    static var previews: some View {
        NewTransactionView()
    }
}
