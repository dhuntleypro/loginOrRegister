//
//  UserAuth.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//


import SwiftUI


class UserAuth: ObservableObject {
    @Published var authState: FBAuthState = .signedOut
    
    
    
    @Published var userIsLoggedin : Bool = false
    @Published var adminIsLoggedin : Bool = false

    
    init() {
        // show login screen if no user
//        DispatchQueue.main.async { // helps with full screen bug
//            self.isLoggedin = FirebaseManager.shared.auth.currentUser?.uid == nil
//        }
        
        
    }
    
    func adminLoggedIn() {
        authState = .signedInAsAdmin
    }
    
    func customerLoggedIn() {
        authState = .signedInAsCustomer
    }
    

    
    
    
    
//
//    func logUserIn() {
//        self.isLoggedin = true
//
//        // firebase code....
//    }
}
