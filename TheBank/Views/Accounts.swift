//
//  Accounts.swift
//  TheBank
//
//  Created by Alessio Roberto on 27/06/2020.
//

import SwiftUI

struct Accounts: View {
    @Environment(\.deeplink) var deeplink
    @State var cellSelected: Int?
    
    var list: [Account]
    
    var body: some View {
        List {
            ForEach((0..<list.count), id: \.self) { index in
                ZStack {
                    NavigationLink(destination: AccountDetail(account: list[index]),
                                   tag: index,
                                   selection: $cellSelected,
                                   label: {
                                    EmptyView()
                                   })
                    AccountCard(account: list[index])
                        .onTapGesture {
                            cellSelected = index
                        }
                }
            }
        }
        .onChange(of: deeplink, perform: { deeplink in
            guard let deeplink = deeplink else { return }
            switch deeplink {
                case .personalAccount:
                    cellSelected = 0
                case .familyAccount:
                    cellSelected = 1
            }
        })
    }
    
    init(list: [Account]) {
        self.list = list
        UITableView.appearance().backgroundColor = .clear
    }
}

struct AccountCard: View {
    var account: Account
    
    var body: some View {
        HStack {
            account.image
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .bottom]/*@END_MENU_TOKEN@*/)
            Text(account.name)
                .bold()
                .multilineTextAlignment(.trailing)
                .padding(.all, 10)
            Text("\(account.amount, specifier: "%.2f") \(account.currency)")
        }
    }
}

struct AccountDetail: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.deeplink) var deeplink
    
    var account: Account
    
    var body: some View {
        VStack {
            Text(account.name)
        }
        .onChange(of: deeplink, perform: { deeplink in
            guard let _ = deeplink else { return }
            presentationMode.wrappedValue.dismiss()
        })
    }
}

struct Accounts_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Accounts(list: AccountService().accounts())
            AccountDetail(account: AccountService().personal())
        }
    }
}
