//
//  CustomTextField.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct CustomTextField: View {
    let label: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(){
//            Text(label)
//                .foregroundColor(Color(hex: "252525"))
//                .font(.headline)
            
            if isSecure {
                SecureField(label, text: $text)
                    .padding(15)
                    .background(Color(hex: "E9F6FE"))
                    .cornerRadius(8)
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
            }else {
                TextField(label, text: $text)
                    .padding(15)
                    .background(Color(hex: "E9F6FE"))
                    .cornerRadius(8)
                    .autocorrectionDisabled(true)                    
                    .autocapitalization(.none)
            }
        }
//        .padding(.horizontal)
    }
}
