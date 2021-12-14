//
//  LoginViewFields.swift
//  YourStore
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI

struct LoginViewFields: View {
    @ObservedObject private var vm = UserAuth()

    //   var authstate : FBAuthState
    @Binding var showResetPassword : Bool
    @Binding var showRegister : Bool
    
    @State var showCustomerView : Bool = false
    @State var showAdminView : Bool = false

    @State var show : Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                
                
                //email
                CustomTextField_2(
                    icon: "envelope",
                    title: "Email",
                    hint: "darrien@gmail.com",
                    value: $vm.email,
                    showPassword: .constant(false))
                    .padding(.top,30)
                
                
                // Password
                CustomTextField_2(
                    icon: "lock",
                    title: "Password",
                    hint: "12345678",
                    value: $vm.password,
                    showPassword: $vm.showPassword)
                    .padding(.top,10)
                
                
                //                // Register Re-enter Password
                if showRegister {
                    CustomTextField_2(
                        icon: "lock",
                        title: "Re-Enter Password",
                        hint: "12345678",
                        value: $vm.re_Enter_Password,
                        showPassword: $vm.showReEnterPassword)
                        .padding(.top,10)
                }
                
                
                // Login Button...
                Button {
                    
                    if showRegister == true {
                        
                        // register ....
                        vm.createNewAccount()
                        
                    }
                    
                    else if showRegister == false {
                        
                        // login ...
                        vm.LoginAdmin()
                        
                    }
                
                } label: {
                    Text(showRegister ?  "Register" : "Log In" )
                        .modifier(ClearButtonStyleLarge(bgColor: .black))
                        .opacity(0.8)
                }
                .padding(8)
                .disabled(showRegister && vm.password != vm.re_Enter_Password)
                
                // cheat .... (fix) should navigate based on state envirment....
                .fullScreenCover(isPresented: $vm.userIsLoggedin ) {
                    if vm.adminIsLoggedin == true {
                        AdminView()
                    } else if vm.adminIsLoggedin == false {
                        CustomerView()
                    }
                    
                }
                
             
                
                HStack {
                    // Forgot Password Button
                    Button {
                        showResetPassword.toggle()
                    } label: {
                        Text("Forgot Password?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.black))
                    }
                    .fullScreenCover(isPresented: $showResetPassword) {
                        Text("ForgotPasswordView()")
                    }
                    
                    
                    // .padding(.top, 8)
                    //    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Spacer()
                    // Register User Button...
                    Button {
                        withAnimation{
                            showRegister.toggle()
                        }
                    } label: {
                        
                        Text(showRegister ?  "Login" :  "Register" )
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.black))
                    }
                    
                }
                
            }
            .padding(.horizontal)
            
            VStack() {
                //  Text("or signin with: ")
                Text("or")
                
                AppleSignInButton()
                    .signInWithAppleButtonStyle(.whiteOutline)
                    .frame(width: 270, height: 45, alignment: .center)
                
                // Show error [ firebase ]
                Text(vm.loginStatusMessage)
                    .foregroundColor(.red)
                
                Spacer()


            }
            //    .padding(.init(top: 400, leading: 50, bottom: 20, trailing: 50))
            
        }
    }
}

struct LoginViewFields_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewFields(showResetPassword: .constant(false), showRegister: .constant(false))
    }
}
