//
//  HomeView.swift
//  FinanceTracker
//
//  Created by KEVIN on 11/10/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(previewAccounts) { account in
                    AccountCell(account: account)
                }
            }
            .padding(24)
        }
        .background(Color("grey"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
