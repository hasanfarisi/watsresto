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
    let icon: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(){
            
            HStack {
                Image(systemName: "\(icon)")
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
                
                if isSecure {
                    SecureField(label, text: $text)
                        .padding(15)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                }else{
                    TextField(label, text: $text)
                        .padding(15)
                        .autocorrectionDisabled(true)
                        .autocapitalization(.none)
                }
            }            
            .overlay(
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
            )
        }
    }
}
