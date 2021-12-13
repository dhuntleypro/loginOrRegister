//
//  AppNavigationView.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//

import SwiftUI

struct AppNavigationView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AppNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavigationView()
    }
}




//
//import SwiftUI
//
//struct AppNavigation: View {
//    
////    @EnvironmentObject var userAuth: UserAuth
//    
//    
//    @State var containedViewType: FBAuthState = .undefined
//    
//    var body: some View {
//        VStack {
//            
//           // containedView()
//            
//            switch containedViewType {
//            case .undefined :
//                if FirebaseManager.shared.auth.currentUser?.uid != nil && userAuth.isAdmin == true {  AnyView(AdminView())
//                    
//                } else if FirebaseManager.shared.auth.currentUser?.uid != nil && userAuth.isAdmin == false {  AnyView(DashboardView())
//                } else {
//                    AnyView(WelcomeView())
//                }
//            case .signedInAsAdmin  :  AnyView(AdminView())
//            case .signedInAsCustomer :  AnyView(DashboardView())
//            case .signedOut :  AnyView(WelcomeView())
//            }
//        }
////        .onAppear() {
////            userAuth.fetchCurrentUser()
////          //  containedView()
////        }
//    }
