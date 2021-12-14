//
//  CustomTextField.swift
//  EcomSkeleton
//
//  Created by Darrien Huntley on 12/12/21.
//

import SwiftUI




@ViewBuilder
func CustomTextField_2(icon: String, title: String , hint: String , value : Binding<String>, showPassword: Binding<Bool>)-> some View {
    
    VStack(alignment: .leading, spacing: 12) {
        
        Label {
            Text(title)
                .font(.custom(customFont, size: 14))
        } icon: {
            Image(systemName: icon)
        }
        .foregroundColor(Color.black.opacity(0.8))

        
        if title.contains("Password") && !showPassword.wrappedValue {
            SecureField(hint, text: value)
                .padding(.top, 2)
        }
        else {
            TextField(hint, text: value)
                .padding(.top, 2)
        }
        
        Divider()
            .background(Color.black.opacity(0.4))
    }
    // Showing Show Button for password field
    .overlay(
        Group {
            if title.contains("Password") {
                Button(action: {
                    showPassword.wrappedValue.toggle()
                    
                }, label: {
                    Text(showPassword.wrappedValue ? "Hide" : "Show")
                        .font(.custom(customFont, size: 13).bold())
                        .foregroundColor(Color(.black))
                })
                    .offset(y: 8)
            }
        }
        
        ,alignment: .trailing
        
    )
}


