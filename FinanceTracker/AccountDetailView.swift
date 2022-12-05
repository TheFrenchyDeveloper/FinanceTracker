//
//  AccountDetailView.swift
//  FinanceTracker
//
//  Created by KEVIN on 21/11/2022.
//

import SwiftUI

struct AccountDetailView: View {
    
    @ObservedObject var account: Account
    @State private var isPresentingNewTransactionScreen = false
    @State var isShowingAlert = false
    @State var isEditingMode = false
    @EnvironmentObject var accoutsList: AccountList
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                HStack {
                    Text(account.name)
                        .font(.system(size: 32, weight: .bold))
                    Spacer()
                    Text("\(String(format: "%.2f", account.amount)) \(account.currency.rawValue)")
                        .font(.system(size: 32, weight: .light))
                }
                AccentButton(title: "+ transaction", color: Color("purple")) {
                    isPresentingNewTransactionScreen = true
                }
                Divider()
                VStack(spacing: 16) {
                    if account.transactions.isEmpty {
                        Text("Aucune transaction pour le moment...")
                            .font(.callout)
                            .foregroundColor(Color(white: 0.4))
                    }
                    ForEach(account.transactions) { transaction in
                        TransactionCell(transaction: transaction)
                    }
                    Text("Solde initial : \(String(format: "%.2f", account.initialAmount))\(account.currency.rawValue)")
                        .font(.callout)
                        .foregroundColor(Color(white: 0.4))
                        .padding()
                }
            }
            .padding()
        }
        .background(Color("grey"))
        .sheet(isPresented: $isPresentingNewTransactionScreen, content: {
            NewTransactionView()
        })
        .toolbar {
            Menu {
                Button {
                    isEditingMode = true
                } label: {
                    Label("Renommer", systemImage: "pencil")
                }
                Button(role: .destructive) {
                    isShowingAlert = true
                } label: {
                    Label("Supprimer", systemImage: "trash")
                }

            } label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.primary)
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Attends !"),
                message: Text("Es-tu sûr de vouloir supprimer ce compte ? Toutes les transactions liées seront perdues."),
                primaryButton: .destructive(Text("Supprimer"), action: {
                    accoutsList.accounts.removeAll { element in
                        element.id == account.id
                    }
                    presentationMode.wrappedValue.dismiss()
                }),
                secondaryButton: .cancel(Text("Annuler")))
        }
    }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(account: previewAccounts[0])
    }
}
