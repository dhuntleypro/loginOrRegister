//
//  CustomerView.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI

struct CustomerView: View {
    @EnvironmentObject var vm: UserAuth
    
    
    var body: some View {
        NavigationView{
            VStack {
                Text("ffff")
            }
            .foregroundColor(.black)

            .navigationTitle(Text("Customer"))
            .navigationBarItems(trailing: Button(action: {vm.SignOutUser() }){
                Image(systemName: "gear")
                    .foregroundColor(.black)
            })
        }
        
    }
}

struct CustomerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomerView()
    }
}
