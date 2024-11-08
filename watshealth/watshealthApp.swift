//
//  watshealthApp.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

@main
struct watshealthApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewRouter)
        }
    }
}
