//
//  MainButton.swift
//  FinanceTracker
//
//  Created by KEVIN on 26/10/2022.
//

import SwiftUI

struct MainButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(.infinity)
        }
    }
}

struct MainButton_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(title: "Preview Button", action: {
            print("Hello !")
        })
        .padding()
    }
}
