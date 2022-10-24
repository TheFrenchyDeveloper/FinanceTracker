//
//  AccountCreationView.swift
//  FinanceTracker
//
//  Created by KEVIN on 25/10/2022.
//

import SwiftUI

struct AccountCreationView: View {
    
    @State private var amount: String = ""
    
    var body: some View {
        HStack {
            TextField("Ex : 200 €", text: $amount)
                .padding(12)
                .padding(.horizontal, 12)
                .keyboardType(.numbersAndPunctuation)
                .submitLabel(.done)
            CurrencySelector()
                .foregroundColor(Color("purple"))
                .padding(4)
        }
        .background(Color.white)
        .cornerRadius(.infinity)
        .padding()
        .background(Color("grey"))
    }
}

struct AccountCreationView_Previews: PreviewProvider {
    static var previews: some View {
        AccountCreationView()
    }
}
