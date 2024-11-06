//
//  ForgotPassword.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var email: String = ""
    @State private var sendCode: Bool = false
    @State private var showLogin: Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                Text("Forgot Password")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                Text("Don’t worry! It happens. Please enter the email associated with your account.")
                    .font(.caption)
                Spacer()
            }
            .padding(.horizontal)
            VStack(spacing: 20){
                CustomTextField(label: "Enter your email", text: $email,icon: "magnifyingglass", isSecure: false)
                
                //Log in button
                Button(action: {
                    //showLogin = true
                }){
                    Text("Send code")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 60)
//                .navigationDestination(isPresented: $showLogin){
//                    Login()
//                }
                Spacer()
                HStack{
                    Text("Remember Password ?")
                    Button(action: {
                        showLogin.toggle()
                    }){
                        Text("Log in")
                    }
                    .navigationDestination(isPresented: $showLogin){
                        Login()
                    }
                }
            }
        }
    }
}

#Preview {
    ForgotPassword()
}
