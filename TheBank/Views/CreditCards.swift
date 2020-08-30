//
//  CreditCards.swift
//  TheBank
//
//  Created by Alessio Roberto on 27/06/2020.
//

import SwiftUI

struct CreditCards: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "creditcard")
                    .padding(.all, 10)
                Text("Principal")
                    .font(.title)
                    .padding(.all, 10)
                Spacer()
            }
            .frame(height: 80.0)
            .background(Color.green)
            .cornerRadius(8.0)
            .padding()
            
            HStack {
                Image(systemName: "creditcard")
                    .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Text("Virtual")
                    .font(.title)
                    .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .frame(height: 80.0)
            .background(Color.green)
            .cornerRadius(8.0)
            .padding()
        }
    }
}

struct Transactions_Previews: PreviewProvider {
    static var previews: some View {
        CreditCards()
    }
}
