//
//  WelcomeView.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI


struct WelcomeView: View {
    
    @ObservedObject private var vm = UserAuth()
    
    // Login or Register view
    @State var showLoginForm : Bool = false
    @State var showRegister : Bool = false

    // Change Language
    @State var isOpenforStateAndCountries : Bool = false

    func fetchInfo() {
        
    }
    
    var body: some View {
        
        ZStack(alignment: .center) {
            
            ZStack {
                Text("PAST PRESENT FUTURE")
                    .foregroundColor(.white)
                    .font(.title)
                //   .font(.custom(customFont, size: 25))
                    .bold()
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Image(systemName: "flag")
                        
                        HStack(spacing: 0) {
                            Text("Shopping from ")
                            Button(action: {
                                //     isOpenforStateAndCountries.toggle()
                            }, label: {
                                Text("United States").underline()
                            })
                            
                            // States list...
                                .sheet(isPresented: $isOpenforStateAndCountries) {
                                    
                                }
                        }
                        .foregroundColor(.white)
                    }
                    .font(.system(size: 14))
                    
                    Button(action: {
                        
                        withAnimation{
                            showLoginForm.toggle()
                            showRegister = true
                        }
                        
                    }) {
                        Text("Sign Up")
                            .modifier(ClearButtonStyleLarge(bgColor: .white))
                    }
                    
                    
                    HStack {
                        Button(action: {
                            
                            withAnimation{
                                showLoginForm.toggle()
                                showRegister = false
                            }
                            
                        }) {
                            Text("Log In").underline()
                        }
                        .fullScreenCover(isPresented: $showLoginForm, onDismiss: fetchInfo){
                            LoginView(showRegister: $showRegister)
                        }
                        
                        Text("or")
                        
                        Button(action: {
                            vm.skipRegister.toggle()
                        })  {
                            Text("Start Browsing").underline()
                        }
                        .fullScreenCover(isPresented: $vm.skipRegister, onDismiss: fetchInfo){
                                CustomerView()
                           
                        }
                        
                    }
                    .foregroundColor(.white)
                    .font(.system(size: 14))
                    
                    
                    
                }
                .padding(.bottom,20)
            }
            .padding(.horizontal, 30)
        //    .padding(.top, getRect().height < 750 ? 20 : 40)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                
                //Color("Purple")
                Image("welcomeBG")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .overlay(Color(.black).opacity(0.5))
            )
        }
    }
    
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
