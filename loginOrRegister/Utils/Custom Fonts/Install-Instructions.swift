//
//  SwiftUIView.swift
//  Ecom
//
//  Created by Darrien Huntley on 12/3/21.
//

import SwiftUI


// To use custom font on all pages...
let customFont = "Raleway-Regular"



struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("Instructions....")
            
            // Easy way
            // 1. Just copy and paste from old project
            // -- Application fonts resource path
            // -- Font provided by application
            
            // or
            
            // 1. Click : Project name | Info |
            // 2. + Bundle Name (2)
            // 3.    Add: Application fonts resource path
            // 4.    Add: Font provided by application
            // 5. - add 3 more items to it
            // 6. - change the values to the font names
            
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
