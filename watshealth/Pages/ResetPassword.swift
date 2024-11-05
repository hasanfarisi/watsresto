//
//  ResetPassword.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct ResetPassword: View {
    @State private var password: String = ""
    @State private var repeatPassword: String = ""
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                Text("Reset Password")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                Text("Don’t worry! It happens. Please enter the email associated with your account.")
                    .font(.caption)
                Spacer()
            }
            .padding(.horizontal)
            VStack(spacing: 20){
                CustomTextField(label: "Enter new password", text: $password, isSecure: true)
                CustomTextField(label: "Repeat new password", text: $repeatPassword, isSecure: true)
                
                //Log in button
                Button(action: {
                    //showLogin = true
                }){
                    Text("Reset password")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 60)
//                .navigationDestination(isPresented: $showLogin){
//                    Login()
//                }
                Spacer()                
            }
        }
    }
}

#Preview {
    ResetPassword()
}
