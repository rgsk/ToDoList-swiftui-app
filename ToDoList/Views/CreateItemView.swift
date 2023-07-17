//
//  CreateItemView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct CreateItemView: View {
    @StateObject var viewModel = CreateItemViewModel()
    let onDismiss: () -> ()
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(label: "Save", background: .pink) {
                    viewModel.save()
                    onDismiss()
                }
                .padding()
            }
        }
    }
}

struct PreviewWrapper: View {
    @State var presented = true
    var body: some View {
        VStack {
            
        }
        .sheet(isPresented: $presented) {
            CreateItemView(onDismiss: {
                presented = false
            })
        }
    }
}

struct CreateItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        PreviewWrapper()
    }
}
