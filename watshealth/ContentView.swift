//
//  ContentView.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    var body: some View {
        ZStack{
//            if showSplash{
//                SplashScreen()
//                    .transition(.opacity)
//                    .animation(.easeOut(duration: 1.5))
//            }else{
                Welcome()
            //Dashboard()
            //}
        }
        .onAppear{
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 3){
                    withAnimation{
                        self.showSplash = false
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
