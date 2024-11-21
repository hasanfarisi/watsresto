//
//  Home.swift
//  watshealth
//
//  Created by mac on 11/6/24.
//

import SwiftUI

struct Home: View {
    @State private var query = ""
    var body: some View {
        ScrollView{
            VStack{
                SliderPromos(promos: ["promo1", "promo1"])
                    .padding(.vertical)
                Spacer()
                CustomTextField(label: "Search for food, restaurants...", text: $query,icon: "magnifyingglass", isSecure: false)
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
//    @State private var restaurantPresented:Bool = false
    var body: some View {
        HStack{
            Text("Restaurants Nearby")
                .font(.title2)
            Spacer()
//            Button(action: {
//                restaurantPresented = true
//            }){
//                HStack{
//                    Text("See all")
//                    Image(systemName: "chevron.forward")
//                }
//                .foregroundColor(Color.gray)
//            }
//            .navigationDestination(isPresented: $restaurantPresented){
//                Dashboard(selectedTab: 3)
//                    .navigationBarBackButtonHidden(true)
//                    
//            }
        }
        Spacer()
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<5){ index in
                    RestaurantsFooter(imgRestaurant: "restaurant1", title: "Restaurant name \(index)", stars: "4.8")
                }
            }
        }
    }
}

#Preview {
    Home()
}
