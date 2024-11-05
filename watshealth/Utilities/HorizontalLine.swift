//
//  HorizontalLine.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct HorizontalLine: View {
    @State public var label: String = ""
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
                
                Text(label)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.horizontal, 0)
                
                Rectangle()
                    .fill(Color.gray)
                    .frame(height: 1)
            }
            .padding(.vertical, 20)
        }
        .padding()
    }
}

#Preview {
    HorizontalLine()
}
