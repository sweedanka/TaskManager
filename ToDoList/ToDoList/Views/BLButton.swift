//
//  BLButton.swift
//  ToDoList
//
//  Created by Danil Kim on 30.10.2023.
//

import SwiftUI

struct BLButton: View {
    let title: String
    let background: Color
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background )
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

struct BLButton_Previews: PreviewProvider {
    static var previews: some View {
        BLButton(title: "Войти", background: .blue) {
            // Action 
        }
    }
}
