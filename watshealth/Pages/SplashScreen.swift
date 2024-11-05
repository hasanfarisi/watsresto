//
//  SplashScreen.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        GradientBackground()
            .overlay(
                VStack{
                    Image("vector")
                        .padding(.bottom, 20)
                    Image("watshealth")
                }
            )
    }
}
