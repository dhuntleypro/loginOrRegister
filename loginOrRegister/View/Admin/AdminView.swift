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
        NavigationView{
            VStack {
                Text("ffff")
            }
            .foregroundColor(.black)

            .navigationTitle(Text("Admin"))
            .navigationBarItems(trailing: Button(action: {vm.SignOutUser() }){
                Image(systemName: "gear")
                    .foregroundColor(.black)
            })
        }
    }
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
