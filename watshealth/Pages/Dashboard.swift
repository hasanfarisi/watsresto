//
//  Dashboard.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct Dashboard: View {
    @State public var selectedTab:Int = 0
    var body: some View {
//        NavigationStack{
            VStack(spacing: 0) {
                // Header Toolbar
                HStack {
                    Button(action: {
                        print("Menu tapped")
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    HStack{
                        Image("vector2")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                        Image("watsresto")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 40)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("Profile tapped")
                    }) {
                        Image("profile")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                }
                .padding()
                TabViewContent(selectedTab: selectedTab)                
                TabView(selection: $selectedTab) {
                    Text("")
                        .tabItem {
                            Image(systemName: "house")
                                .frame(width: 30)
                            Text("Home")
                        }
                        .tag(0)
                    
                    Text("")
                        .tabItem {
                            Image(systemName: "fork.knife")
                                .frame(width: 30)
                            Text("Foods")
                        }
                        .tag(1)
                    
                    Text("")
                        .tabItem {
                            Image(systemName: "building.columns")
                                .frame(width: 30)
                            Text("Restaurants")
                        }
                        .tag(2)
                    
                    Text("")
                        .tabItem {
                            Image(systemName: "cart.fill")
                                .frame(width: 30)
                            Text("Cart")
                        }
                        .tag(3)
                }
                .frame(height: 90)
            }
            .ignoresSafeArea(edges: .bottom) // Keeps TabView flush with bottom
        }
//    }
}

struct TabViewContent: View {
    let selectedTab: Int
    var body: some View {
        VStack {
            switch selectedTab {
            case 0:
                Home()
            case 1:
                FoodsIndex()
            case 2:
                RestaurantsIndex()
            case 3:
                Cart()
            default:
                Home()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white) // Optional: Background for content area
    }
}


struct ProfileView: View {
    var body: some View {
        Text("Profile Content")
            .font(.largeTitle)
            .padding()
    }
}
