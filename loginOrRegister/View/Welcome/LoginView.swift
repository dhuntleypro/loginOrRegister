//
//  LoginView.swift
//  YourStore
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth

struct LoginView: View {
    @EnvironmentObject var userAuth: UserAuth

    @Binding var showRegister : Bool
    
    var body: some View {
        ZStack {
            
                Design_LoginView_1(showRegister: $showRegister)
            
       }
        .foregroundColor(Color.black)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(showRegister: .constant(false))
    }
}
