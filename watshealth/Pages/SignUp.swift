//
//  SignUp.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct SignUp: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var phoneNumber: String = ""
    @State private var showForgotPassword: Bool = false
    @State private var isGoogle: Bool = false
    @State private var isApple: Bool = false    
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 20){
                Text("Sign up")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.black)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .font(.caption)
                Spacer()
            }
            .padding(.horizontal)
            VStack(spacing: 20){
                CustomTextField(label: "Your username", text: $username,icon: "person.fill", isSecure: false)
                    .padding(.horizontal)
                CustomTextField(label: "Your phone number", text: $phoneNumber,icon: "phone.fill", isSecure: false)
                    .padding(.horizontal)
                CustomTextField(label: "Your email", text: $email,icon: "at.circle.fill", isSecure: false)
                    .padding(.horizontal)
                CustomTextField(label: "Your password", text: $password,icon: "lock.fill", isSecure: true)
                    .padding(.horizontal)
                
                //Log in button
                Button(action: {
                    viewRouter.numberOfPage = 0 //Home
                    viewRouter.currentPage = .dashboard
                }){
                    Text("Sign up")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 60)
            }
            HorizontalLine(label: "or Continue with")
            IconButtonStyle(action: isGoogle,iconName: "google", labelText: "Sign up with Google", isIcon: false)
            IconButtonStyle(action: isApple,iconName: "applelogo", labelText: "Sign up with Apple", isIcon: true)
            HStack{
                Text("Already have an account ?")
                Button(action: {
                    viewRouter.numberOfPage = 0 //Login
                    viewRouter.currentPage = .authentication
                }){
                    Text("Log in")
                }
            }
            Spacer()
                .padding(.vertical, 0)
        }
    }
}

#Preview {
    SignUp()
}
