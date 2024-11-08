//
//  Welcome.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct Welcome: View {
    @State private var showRegister: Bool = false
    @EnvironmentObject var viewRouter: ViewRouter
    
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
                    viewRouter.numberOfPage = 0 //Login
                    viewRouter.currentPage = .authentication
                }){
                    Text("Login")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 60)
                
                //Sign up button
                Button(action: {
                    viewRouter.numberOfPage = 1 // Signup
                    viewRouter.currentPage = .authentication
                }){
                    Text("Sign Up")
                        .font(.headline)
                }
                .buttonStyle(FlatButton())
                .padding(.horizontal, 60)
            }
        }
    }
}

#Preview {
    Welcome()
}
