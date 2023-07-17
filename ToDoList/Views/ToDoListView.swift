//
//  TodoListItemsView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewModel()
    let userId: String

    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showCreateItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showCreateItemView) {
                CreateItemView (onDismiss: {
                    viewModel.showCreateItemView = false
                })
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
