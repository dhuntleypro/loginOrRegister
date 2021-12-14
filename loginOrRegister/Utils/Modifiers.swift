//
//  Modifiers.swift
//  Goat
//
//  Created by Darrien Huntley on 12/2/21.
//


import SwiftUI

struct Modifiers: View {
    @State var want = false
    var body: some View {
        VStack {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Even")
        })
        .modifier(ClearButtonEven(bgColor: .black))
            
            
            Button(action: {}, label: {
                Text("Small")
            })
            .modifier(ClearButtonStyleSmall(bgColor: .black))


            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("large")
            })
            .modifier(ClearButtonStyleLarge(bgColor: .black))

            Button(action: {}, label: {
                Text("Want")
            })
            .modifier(ClearButtonEvenSmall(bgColor: .black))

            Button(action: {}, label: {

                VStack(alignment: .leading ) {
                    Text("Standard: $12")
                        .foregroundColor(.black)
                        .padding(.bottom, 5)
                    Text("The item will be shipped within 24 hours ")

                }
            })
            .modifier(ClearButtonStyleleading(bgColor: .black))

            Button(action: {}, label: {
                Text("Checkout")
            })
            .modifier(myBlackCheckout(bgColor: .black))
            
            Button(action: {
                want.toggle()
            }, label: {
                Text("Want")
                    .modifier(want ? myWhiteToBlackButton(black: false) : myWhiteToBlackButton(black: true))
                
            })
        
            

        }
        
        
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        Modifiers()
    }
}


// See through Button
struct ClearButtonEven: ViewModifier {
    var bgColor: Color
  
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(bgColor)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 100, height: 35, alignment: .center)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}

// See through Button
struct ClearButtonEvenSmall: ViewModifier {
    var bgColor: Color
  
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(bgColor)
            .font(.system(size: 12, weight: .regular, design: .default))
            .frame(width: 60, height: 30, alignment: .center)
            .contentShape(Rectangle())
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}



// See through Button
struct ClearButtonStyleSmall: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(bgColor)
            .padding(.leading, 12)
            .padding(.trailing, 12)
            .padding(.all, 7)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}

// See through Button
struct ClearButtonStyleLarge: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(bgColor)
            .padding(.leading, 102)
            .padding(.trailing, 102)
            .padding(.all, 14)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}


// See through Button
struct ClearButtonStyleleading: ViewModifier {
    var bgColor: Color
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .foregroundColor(bgColor)
        
          //  .padding(.leading, 2)
          //  .padding(.trailing, 50)
            .padding(.trailing, 60)
            .padding(.all, 15)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}




// Black Checkout *
struct myBlackCheckout: ViewModifier {
    var bgColor: Color
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 14, weight: .regular, design: .default))
            .frame(width: 300, height: 42, alignment: .center)
            .contentShape(Rectangle())
            .background(Color.black)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(bgColor, lineWidth: 1)
            )
    }
}

// white to Black  Button *
struct myWhiteToBlackButton: ViewModifier {
    var black: Bool
  
    func body(content: Content) -> some View {
        content
            .foregroundColor(black ? .white : .black)
            .font(.system(size: 10, weight: .regular, design: .default))
            .frame(width: 80, height: 30, alignment: .center)
            .contentShape(Rectangle())
            .background(Color(black ? .black : .white))
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(black ? Color.black : Color.black, lineWidth: 1)
            )
    }
}


