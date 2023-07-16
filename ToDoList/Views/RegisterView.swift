//
//  RegusterView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            Header(title: "Register", subtitle: "Start organizing todos", rotationAngle: -15, background: .orange)
                .offset(y:-140)
            
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                
                TLButton(label: "Create Account", background: Color.green) {
                    viewModel.register()
                }
            }
            .offset(y:-40)
            
            
            Spacer()
        }
    }
    
    
}

struct BackButtonForPreview: View {
    var body: some View {
        Button(action: {
            // Back button tapped
        }) {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            // button is not visible because it is below RegisterView
            BackButtonForPreview()
            RegisterView()
        }
    }
}
