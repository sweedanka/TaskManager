//
//  HeaderView.swift
//  ToDoList
//
//  Created by Danil Kim on 24.10.2023.
//

import SwiftUI

struct HeaderView: View {
    
    let background: Color
    let angle: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            HStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 90, height: 90)
                    .padding(.top, 80)
                    .padding(10)
                VStack(alignment: .leading) {
                    Text("Запланируй.")
                        .font(.system(size: 30, design: .rounded))
                        .foregroundColor(Color.white)
                        .italic()
                    Text("Сделай.")
                        .font(.system(size: 30, design: .rounded))
                        .foregroundColor(Color.white)
                        .italic()
                    Text("Сдай.")
                        .font(.system(size: 30, design: .rounded).weight(.bold))
                        .foregroundColor(Color.white)
                        
                }
                .padding(.top, 80)
            }
        }
        .offset(y: -150)
        .frame(width: UIScreen.main.bounds.width * 3, height: 330)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(background: .blue, angle: 15)
    }
}
