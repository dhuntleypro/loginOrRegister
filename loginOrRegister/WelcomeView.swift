//
//  WelcomeView.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject private var vm = UserAuth()


    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack {
            
                Button(action: {
                    vm.userIsLoggedin = true
                    vm.adminIsLoggedin = false
                }) {
                    Text("Sign In Customer")
                }
                .fullScreenCover(isPresented: $vm.userIsLoggedin ) {
                    if vm.adminIsLoggedin == true {
                        AdminView()
                    } else if vm.adminIsLoggedin == false {
                        CustomerView()
                    }
                        
                    }
                Button(action: {
                    vm.userIsLoggedin = true
                    vm.adminIsLoggedin = true
                }) {
                    Text("Sign In Admin")
                }
            }
            
           
        }
       
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
