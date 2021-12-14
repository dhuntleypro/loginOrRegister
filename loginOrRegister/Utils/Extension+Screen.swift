//
//  Extension+Screen.swift
//  GOAT
//
//  Created by Darrien Huntley on 12/3/21.
//

import SwiftUI


// Extending view to get Screen Bounds...
extension View {
    func getRect()->CGRect {
        return UIScreen.main.bounds
    }
}
