//
//  CurrencySelector.swift
//  FinanceTracker
//
//  Created by KEVIN on 24/10/2022.
//

import SwiftUI

struct CurrencySelector: View {
    
    // La liste de toutes les devises
    private let currencies = Currency.allCases
    
    // La devise sélectionnée
    @State private var selectedCurrency: Currency = .euro
    
    // Mode sélection
    @State private var isSelectedMode = false
    
    
    var body: some View {
        ZStack {
            ForEach(currencies.indices) { index in
                Image(systemName: selectedCurrency == currencies[index] ? currencies[index].filledIconName : currencies[index].iconName)
                    .font(.system(size: 32))
                    .offset(x: isSelectedMode ? -CGFloat(index) * 40 : 0)
                    .opacity(selectedCurrency == currencies[index] || isSelectedMode ? 1 : 0)
                    .onTapGesture {
                        if isSelectedMode {
                            selectedCurrency = currencies[index]
                        }
                        withAnimation(.easeInOut(duration: 0.2)) {
                            isSelectedMode.toggle()
                        }
                    }
            }
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector()
    }
}
