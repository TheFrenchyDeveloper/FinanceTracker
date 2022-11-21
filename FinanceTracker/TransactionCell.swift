//
//  TransactionCell.swift
//  FinanceTracker
//
//  Created by KEVIN on 21/11/2022.
//

import SwiftUI

struct TransactionCell: View {
    
    let transaction: Transaction
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy à HH:mm"
        return formatter
    }()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.label)
                    .font(.headline)
                Text(dateFormatter.string(from: transaction.date))
                    .font(.footnote)
                    .foregroundColor(Color(white: 0.4))
            }
            Spacer()
            Text(transaction.amount.description)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
    }
}

struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell(transaction: previewTransactions[0])
            .padding(24)
            .background(Color("grey"))
            .previewLayout(.sizeThatFits)
    }
}
