//
//  Dashboard.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        ZStack{
            TabView{
                Home()
                    .tabItem{
                        Image(systemName: "house.fill")
                            .foregroundColor(Color.gray)
                        Text("Home")
                    }
                Home()
                    .tabItem{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.gray)
                        Text("Search")
                    }
                Home()
                    .tabItem{
                        Image(systemName: "cart.fill")
                            .foregroundColor(Color.gray)
                        Text("Chart")
                    }
            }
        }
    }
}

struct Home: View {
    var body: some View {
        NavigationView{
            Content()
                .navigationBarItems(
                    leading:
                        HStack{
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "line.horizontal.3")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.primary)
                            })
                        },
                    trailing:
                        HStack{
                            Button(action: {print("button 1")}){
                                Image("profile")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 35, height: 35)
                                    .clipShape(.circle)
                            }
                        }
                )
                .navigationBarTitle("", displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Content:View {
    @State private var query = ""
    var body: some View {
        ScrollView{
            VStack{
                SliderPromos(promos: ["promo1", "promo1"])
                    .padding(.vertical)
                Spacer()
                CustomTextField(label: "Search for food, restaurants...", text: $query, isSecure: false)
                BestOffer()
                Spacer()
                    .padding(.vertical, 2)
                RestaurantsNearby()
            }
            .padding(.horizontal)
        }
    }
}

struct BestOffer:View {
    var body: some View {
        HStack{
            Text("Best Offers")
                .font(.title2)
            Image("hot")
            Spacer()
            Button(action: {}, label: {
                HStack{
                    Text("See all")
                    Image(systemName: "chevron.forward")
                }
                .foregroundColor(Color.gray)
            })
        }
        Spacer()
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<5){ index in
                    BestOfferProducts(imgMenu: "menu1", title: "Food\(index)", detail: "lorem ipsum", price: "\(28000*index)")
                }
            }
        }
    }
}

struct RestaurantsNearby:View {
    var body: some View {
        HStack{
            Text("Restaurants Nearby")
                .font(.title2)
            Spacer()
            Button(action: {}, label: {
                HStack{
                    Text("See all")
                    Image(systemName: "chevron.forward")
                }
                .foregroundColor(Color.gray)
            })
        }
        Spacer()
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<5){ index in
                    Restaurants(imgRestaurant: "restaurant1", title: "Restaurant name \(index)", stars: "4.8")
                }
            }
        }
    }
}

#Preview {
    Dashboard()
}
