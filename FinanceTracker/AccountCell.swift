//
//  AcocuntCell.swift
//  FinanceTracker
//
//  Created by KEVIN on 11/10/2022.
//

import SwiftUI

struct AccountCell: View {
    
    let account:  Account
    
    var body: some View {
        HStack(spacing: 8) {
            Image(account.iconName)
                .resizable()
                .padding(4)
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 4) {
                Text(account.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("Somme : \(String(format: "%.2f", account.amount)) €") // Permet d'afficher 2 chiffres après la virgule
                    .font(.footnote)
                    .foregroundColor(Color(white: 0.4))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading) // Permet de prendre toute la largeur de la vue
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct AccountCell_Previews: PreviewProvider {
    
    static let previewAccount = Account(iconName: "icon_002", name: "Paypal", amount: 1234.56)
    
    static var previews: some View {
        VStack {
            AccountCell(account: previewAccount)
        }
        .padding()
        .background(Color("grey"))
        .previewLayout(.sizeThatFits) // Permet d'avoir que la cellule en preview au lieu du téléphone entier
    }
}
