//
//  LoginView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                Header(title: "To Do List", subtitle: "Get things done", rotationAngle: 15, background: .pink)                 .offset(y:-100)
                
                // Login Form
                
                Form {
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
                    
                    TLButton(label: "Log In", background: Color.blue, loading: $viewModel.loading) {
                        viewModel.login()
                    }
                }
                
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }.padding(.bottom, 50)
                    .padding(.top, 10)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
