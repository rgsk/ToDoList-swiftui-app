//
//  TLButton.swift
//  ToDoList
//
//  Created by Rahul Gupta on 17/07/23.
//

import SwiftUI

struct TLButton: View {
    let label: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                Text(label)
                    .foregroundColor(.white)
                    .bold()
            }
            
        }
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TLButton(label: "Login", background: .pink) {
                print("button tapped")
            }
              
        }
    }
}
