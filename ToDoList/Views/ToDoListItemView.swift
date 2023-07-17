//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                viewModel.toggleIsComplete(item: item)
            } label: {
                Image(systemName: item.isComplete ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item:.init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isComplete: false))
            .previewDisplayName("not completed")
        
        ToDoListItemView(item:.init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createdAt: Date().timeIntervalSince1970, isComplete: true))
            .previewDisplayName("completed")
    }
}
