//
//  HeaderView.swift
//  ToDoList
//
//  Created by Rahul Gupta on 16/07/23.
//

import SwiftUI

struct Header: View {
    let title: String
    let subtitle: String
    let rotationAngle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: rotationAngle))
            
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header(title: "Title", subtitle: "Subtitle", rotationAngle: 15, background: .blue)
    }
}
