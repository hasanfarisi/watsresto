//
//  Login.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct Login: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showForgotPassword: Bool = false
    @State private var isGoogle: Bool = false
    @State private var isApple: Bool = false
    @State private var showRegister: Bool = false
    @State private var showDashboard: Bool = false
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                Text("Login")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .font(.caption)
                Spacer()
            }
            .padding(.horizontal)
            VStack(spacing: 20){
                CustomTextField(label: "Your email", text: $email,icon: "person.fill", isSecure: false)
                    .padding(.horizontal)
                CustomTextField(label: "Your password", text: $password,icon: "lock.fill", isSecure: true)
                    .padding(.horizontal)
                Button(action: {
                    showForgotPassword = true
                }){
                    Text("Forgot password?")
                        .font(.headline)
                        .foregroundColor(Color(hex: "009944"))
                }
                .padding(.horizontal, 60)
                .navigationDestination(isPresented: $showForgotPassword){
                    ForgotPassword()
                }
                
                //Log in button
                Button(action: {
                    showDashboard = true
                }){
                    Text("Login")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 60)
                .navigationDestination(isPresented: $showDashboard){
                    Dashboard(selectedTab: 0)
                        .navigationBarBackButtonHidden(true)
                }
            }
            HorizontalLine(label: "or Continue with")
            IconButtonStyle(action: isGoogle,iconName: "google", labelText: "Login with Google", isIcon: false)
            IconButtonStyle(action: isApple,iconName: "applelogo", labelText: "Login with Apple", isIcon: true)
            HStack{
                Text("Don’t have an account ?")
                Button(action: {
                    showRegister.toggle()
                }){
                    Text("Sign up")
                }
                .navigationDestination(isPresented: $showRegister){
                    SignUp()
                }
            }
            Spacer()
                .padding(.vertical, 0)
        }
    }
}

#Preview {
    Login()
}
