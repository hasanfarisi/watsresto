//
//  GradientButtonStyle.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "009944"), Color(hex: "004422")]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
            )
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct FlatButton: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .foregroundColor(Color(hex: "009944"))
            .background(Color(hex: "F7F8F9"))
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct TabItemView: View {
    var icon: String
    var label: String
    var isSelected: Bool

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image(systemName: icon)
                    .font(.largeTitle)
                    .foregroundColor(isSelected ? .green : .gray)
                    .frame(width: 80)
                Text(label)
                    .foregroundColor(isSelected ? .green : .gray)
                    .font(.headline)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color(hex: "009944") : Color.clear, lineWidth: 5)
            )
            .background(isSelected ? Color.white : Color(hex: "F7F8F9"))
            .cornerRadius(10)
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
                    .offset(x: 10, y: -10)
            }
        }
        .frame(width: 120, height: 100)
    }
}
