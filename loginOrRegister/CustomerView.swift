//
//  CustomerView.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI

struct CustomerView: View {
  //  @ObservedObject private var vm = UserAuth()
    @EnvironmentObject var vm: UserAuth


    var body: some View {
        NavigationView {
        VStack {
            
        }
        .navigationTitle(Text("Customer"))
        .navigationBarItems(trailing: Button(action: {vm.userIsLoggedin = false }){
            Image(systemName: "gear")
        })
        }
        
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
