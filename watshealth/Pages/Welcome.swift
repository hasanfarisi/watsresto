//
//  Welcome.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct Welcome: View {
    @State private var showLogin: Bool = false
    @State private var showRegister: Bool = false
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Image("vector2")
                    .padding(.bottom, 20)
                Image("watsresto")
                
                Text("Welcome to the WatssResto app!")
                    .font(.caption)
                    .padding(.bottom, 20)
                
                //Log in button
                Button(action: {
                    showLogin = true
                }){
                    Text("Login")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 60)
                .navigationDestination(isPresented: $showLogin){
                    Login()
                }
                
                //Sign up button
                Button(action: {
                    showRegister = true
                }){
                    Text("Sign Up")
                        .font(.headline)
                }
                .buttonStyle(FlatButton())
                .padding(.horizontal, 60)
                .navigationDestination(isPresented: $showRegister){
                    SignUp()
                }
            }
        }
    }
}

#Preview {
    Welcome()
}
