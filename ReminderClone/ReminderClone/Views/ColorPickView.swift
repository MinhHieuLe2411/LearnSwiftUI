//
//  ColorPickView.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 9/1/26.
//

import SwiftUI

struct ColorPickView: View {
    @Binding var selectedColor: Color
    
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Circle().fill()
                        .foregroundColor(color)
                        .padding(2)
                    Circle()
                        .strokeBorder(selectedColor == color ? .gray: .clear, lineWidth: 2 )
                        .scaleEffect(CGSize(width: 1.1, height: 1.1))
                }.onTapGesture {
                    selectedColor = color
                }
            }
        }.padding()
            .frame(maxWidth: .infinity, maxHeight: 100)
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}

#Preview {
    ColorPickView(selectedColor: .constant(.yellow))
}
