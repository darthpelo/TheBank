//
//  TransferSection.swift
//  TheBank
//
//  Created by Alessio Roberto on 26/06/2020.
//

import SwiftUI

struct TransferSection: View {
    var body: some View {
        NavigationView {
            TransferView(list: stubUsers)
        }
    }
}

private struct TransferView: View {
    @Environment(\.deeplink) var deeplink

    var list: [User]

    var body: some View {
        List(list) { user in
            NavigationLink(
                destination: TransferMoney(user: user)
                    .environment(\.deeplink, deeplink),
                label: {
                    HStack {
                        Image(systemName: "person.circle")
                        Text(user.name)
                    }
                })
        }
        .navigationBarTitle(Text("Family & Friends"))
    }
}

struct TransferView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TransferSection()
            TransferMoney(user: User(name: "Theo"))
        }
    }
}
