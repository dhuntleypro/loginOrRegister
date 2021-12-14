//
//  AdminView.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI

struct AdminView: View {
    @EnvironmentObject var vm: UserAuth

    var body: some View {
        NavigationView {
        VStack {
            
        }
        .navigationTitle(Text("Admin"))
        .navigationBarItems(trailing: Button(action: {vm.userIsLoggedin = false }){
            Image(systemName: "gear")
        })
        }
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
