//
//  ChatUser.swift
//  Chat
//
//  Created by Darrien Huntley on 12/9/21.
//

import SwiftUI

struct StoreUser: Identifiable {
    var id: String { uid }
    
    let uid , email, profileImageUrl : String
    let isAdmin : Bool
    
    init(data: [String: Any]) {
        self.uid = data ["uid"] as? String ?? ""
        self.email = data ["email"] as? String ?? ""
        self.profileImageUrl = data ["profileImageUrl"] as? String ?? ""
        self.isAdmin = data["isAdmin"] as? Bool ?? false

    }
    
}
