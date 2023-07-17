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
    @Binding var loading: Bool
    let action: () -> Void
    
    
    var body: some View {
        Button{
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(loading ? .gray : background)
                HStack(spacing: 10) {
                    if loading {
                        ProgressView()
                    }
                    
                    Text(label)
                        .foregroundColor(.white)
                        .bold()
                }
            }
        }
        .disabled(loading)
        .padding()
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            TLButton(label: "Login", background: .pink, loading: Binding(get:{
                return true
            }, set: {
                _ in
            })) {
                print("button tapped")
            }
            
            TLButton(label: "Login", background: .pink, loading: Binding(get:{
                return false
            }, set: {
                _ in
            })) {
                print("button tapped")
            }
            
        }
    }
}
