//
//  MainSection.swift
//  TheBank
//
//  Created by Alessio Roberto on 26/06/2020.
//

import SwiftUI

struct MainSection: View {
    var body: some View {
        NavigationView {
            MainView(accountService: AccountService())
        }
    }
}

private struct MainView: View {
    @Environment(\.deeplink) var deeplink

    var accountService: AccountService

    var body: some View {
        VStack {
            SectionTitle(title: "Your Accounts")
            Accounts(list: accountService.accounts())
                .padding(.trailing, 40.0)
                .environment(\.deeplink, deeplink)
            SectionTitle(title: "Your Cards")
            Spacer()
            CreditCards()
            Spacer()
        }.navigationTitle("The Bank")
    }
}

private struct SectionTitle: View {
    var title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .padding(.top, 20)
            Spacer()
        }
    }
}

struct MainSection_Previews: PreviewProvider {
    static var previews: some View {
        MainSection()
    }
}
