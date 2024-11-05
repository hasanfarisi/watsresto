//
//  IconButtonStyle.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct IconButtonStyle: View {
    @State var action: Bool = false
    @State var iconName: String = ""
    @State var labelText: String = ""
    @State var isIcon: Bool = true
    var body: some View {
        Button(action: {
            action.toggle()
        }){
            HStack{
                if isIcon {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 20, height: 25)
                        .padding(.trailing, 8)
                        .foregroundColor(Color.black)
                }else{
                    Image(iconName)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing, 8)
                }
                Text(labelText)
                    .fontWeight(.thin)
                    .foregroundColor(.black)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.black.opacity(action ? 0.3 : 0))
            .cornerRadius(10)
            .border(.black, width: 1)
        }
        .padding(.horizontal, 20)
    }
}
