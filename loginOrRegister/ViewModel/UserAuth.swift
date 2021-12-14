//
//  UserAuth.swift
//  loginOrRegister
//
//  Created by Darrien Huntley on 12/13/21.
//


import SwiftUI
import Firebase

class UserAuth: ObservableObject {
    @Published var userIsLoggedin : Bool = false
    @Published var adminIsLoggedin : Bool = false
    @Published var skipRegister : Bool = false
    
    
    
    
    @Published var errorMessage = ""
    @Published var storeUser : StoreUser?
    
    // Error Message
    @Published var loginStatusMessage = ""
    
    
    // User input
    @Published var email = ""
    @Published var password = ""
    @Published var isAdmin = false
    
    @Published var showPassword = false
    @Published var showReEnterPassword = false
    @Published var re_Enter_Password = ""
    
    
    
    
    
    init() {

    }
    
    func LoginAdmin() {
        
        // firebase...
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {  result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            self.userIsLoggedin = true
            self.adminIsLoggedin = false
        }
    }
    
    
    
    func LoginCustomer() {
        
        
        // firebase...
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) {  result, err in
            if let err = err {
                print("Failed to login user:", err)
                self.loginStatusMessage = "Failed to login user: \(err)"
                return
            }
            
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
            
            self.loginStatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
            
            
            self.userIsLoggedin = true
            self.adminIsLoggedin = false
        }
    }
    
    // [ firebase - create user ]
    private func createNewAccount() {
        self.loginStatusMessage = "You must select an avatar image"
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                self.loginStatusMessage = "Failed to create user: \(err)"
                return
            }
            
            print("Successfully created user: \(result?.user.uid ?? "")")
            self.loginStatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
            
            self.storeUserInformation()
            
            // Admin
            if self.userIsLoggedin && self.adminIsLoggedin {
                self.LoginAdmin()
                
            // customer
            } else if self.userIsLoggedin && self.adminIsLoggedin {
                self.LoginCustomer()

            }
        }
        
    }
    
    
    
    private func storeUserInformation() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
        let userData = ["email" : self.email ,
                        "uid" : uid ,
                        "isAdmin" : self.isAdmin
        ] as [String : Any]
        
        FirebaseManager.shared.firestore
            .collection("users")
            .document(uid)
            .setData(userData) { err in
                if let err = err {
                    print(err)
                    self.loginStatusMessage = "\(err)"
                    return
                }
                
                print("Success")
            }
    }
    
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else {
            
            self.errorMessage = "Could not find firebase uid"
            return
        }
        
        // self.errorMessage = "\(uid)"
        
        
        FirebaseManager.shared.firestore
            .collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                if let error = error {
                    self.errorMessage = "build to fetch current user \(error)"
                    
                    print("Fail to fetch current user", error)
                    return
                }
                //  self.errorMessage = "\(uid)"
                
                guard let data = snapshot?.data() else {
                    self.errorMessage = "No Data found"
                    return
                }
                
                self.storeUser = .init(data: data)
                
                // Shows all the data under user
                // self.errorMessage = "Data: \(data.description)"
                
                
            }
    }
    
    
    // Sign Out
    func SignOutUser() {
        // Change state
      //  isLoggedin = false
        
        // Log out of firebase
        try? FirebaseManager.shared.auth.signOut()
        
        print("User signed out")
      //  self.authState = .signedOut

        self.fetchCurrentUser()
        
        userIsLoggedin = false 
        
        

    }
    
}
