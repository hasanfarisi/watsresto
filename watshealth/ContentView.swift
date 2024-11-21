//
//  ContentView.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        NavigationStack {
            ZStack{
                if viewRouter.currentPage == .main || viewRouter.currentPage == nil {
                    Welcome()
                        .environmentObject(viewRouter)
                } else if viewRouter.currentPage == .dashboard {
                    Dashboard()
                        .environmentObject(viewRouter)
                } else if viewRouter.currentPage == .authentication {
                    if viewRouter.numberOfPage == 0 {
                        Login()
                    }else{
                        SignUp()
                    }
                }
            }
        }
    }
}
