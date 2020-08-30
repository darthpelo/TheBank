//
//  ContentView.swift
//  TheBank
//
//  Created by Alessio Roberto on 26/06/2020.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.deeplink) var deeplink
    @SceneStorage("selectedTab") var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            MainSection()
                .tabItem {
                    Image(systemName: "bahtsign.circle")
                    Text("Main")
                        .fontWeight(.semibold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
                }.tag(0)
            TransferSection()
                .tabItem {
                    Image(systemName: "arrow.right.arrow.left.square")
                    Text("Transfer")
                }.tag(1)
        }
        .onChange(of: deeplink, perform: { deeplink in
            guard let _ = deeplink else { return }
            if selectedTab == 1 {
                selectedTab = 0
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
