//
//  FirebaseManager.swift
//  Chat
//
//  Created by Darrien Huntley on 12/9/21.
//


import SwiftUI
import Firebase

// When installing firebase select : Firebase auth + Firebase Storage
// Install firestore through cocopods


class FirebaseManager: NSObject {
    let auth: Auth
    let storage : Storage
    let firestore : Firestore
    
    static let shared = FirebaseManager()
    

    override init() {
        FirebaseApp.configure()
        
        self.auth = Auth.auth()
        self.storage = Storage.storage()
         self.firestore = Firestore.firestore()
        
        super.init()
    }
}



struct FirebaseConstants {
    
    static let messages = "messages"
    static let fromId = "fromId"
    static let toId = "toId"
    static let text = "text"
    static let email = "email"

    static let profileImageUrl = "profileImageUrl"
    static let timestamp = "timestamp" // fix acroos app
    
    static let recent_messages = "recent_messages"
}
