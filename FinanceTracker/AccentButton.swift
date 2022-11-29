//
//  AccentButton.swift
//  FinanceTracker
//
//  Created by KEVIN on 26/10/2022.
//

import SwiftUI

struct AccentButton: View {
    
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .frame(width: 300)
                .foregroundColor(.black)
                .font(.callout)
                .fontWeight(.semibold)
                .padding(8)
                .background(color)
                .cornerRadius(10)
        }
    }
}

struct AccentButton_Previews: PreviewProvider {
    static var previews: some View {
        AccentButton(title: "Test Button", color: Color("orange"), action: {})
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
