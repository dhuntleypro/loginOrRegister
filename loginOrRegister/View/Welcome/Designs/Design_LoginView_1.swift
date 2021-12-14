//
//  Design_LoginView_1.swift
//  YourStore
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI
import Firebase // may not need


struct Design_LoginView_1: View {

    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userAuth: UserAuth

 //   @ObservedObject private var vm = UserAuth()

    @State var showResetPassword : Bool = false
    
    @Binding var showRegister : Bool

    var body: some View {
        VStack(spacing: 0) {
            // Nav
            HStack {
                Text("")
                    .frame(width: 20)
                
                Spacer()
                
                
                Text(showRegister ? "Register" :  "Log In" )
               //     .font(.custom(customFont, size: 16))
                
                Spacer()
                
                Button(action:{
                    //  showLoginPage.toggle()
                    //   loginData.registerUser = false
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .font(.custom(customFont, size: 20))
                }
                .frame(width: 20)
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            
            // Textfields....
            LoginViewFields(showResetPassword: $showResetPassword, showRegister: $showRegister)
            
           
            
            
           
            
        }
        .background(Color("HomeBG"))
        .onAppear(){
            userAuth.fetchCurrentUser()
        }
       
    }
    

    
}

struct Design_LoginView_1_Previews: PreviewProvider {
    static var previews: some View {
        Design_LoginView_1(showRegister: .constant(true))
    }
}

