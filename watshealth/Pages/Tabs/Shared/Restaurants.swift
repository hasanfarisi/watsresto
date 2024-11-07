//
//  Restaurants.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct RestaurantsIndex:View {
    @State private var query: String = ""
    @State private var showDetails:Bool = false    
    var body: some View {
//        NavigationView{
        VStack(alignment: .leading){
                CustomTextField(label: "Search for restaurant", text: $query, icon: "magnifyingglass", isSecure: false)
                    .padding(.horizontal, 20)
                ScrollView{
                    HStack{
                        Text("Popular Restaurants")
                            .font(.title2)
                        Spacer()
                        Text("10 Result")
                            .font(.caption)
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical, 20)
                    Spacer()
                    VStack(alignment: .leading){
                        ForEach(0..<10){index in
                            NavigationLink(destination: RestaurantDetail()){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color.white)
                                        .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                                        .frame(height: 150)
                                    VStack{
                                        HStack{
                                            Image("restaurant1")
                                            VStack(alignment: .leading){
                                                Text("Restaurant name \(index)")
                                                    .font(.callout)
                                                    .foregroundColor(Color.black)
                                                HStack{
                                                    ForEach(0..<5){star in
                                                        Image(systemName: "star.fill")
                                                            .foregroundColor(Color.orange)
                                                            .font(.system(size: 8))
                                                    }
                                                }
                                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor consectetur adipiscing elit")
                                                    .font(.caption2)
                                                    .foregroundColor(Color.black)
                                                    .multilineTextAlignment(.leading)
                                                Spacer()
                                            }
                                        }
                                        HStack{
                                            Image(systemName: "pin.fill")
                                                .font(.caption)
                                            Text("1,2 Km from location")
                                                .font(.caption)
                                            Spacer()
                                            Button {
                                                
                                            } label: {
                                                Text("View on Google Maps")
                                                    .foregroundColor(Color.purple)
                                                    .font(.caption)
                                            }
                                            
                                        }
                                        .foregroundColor(Color.black)
                                    }
                                    .padding()
                                }
                            }
                            .navigationDestination(isPresented: $showDetails){
                                RestaurantDetail()
                            }
                        }
                    }
                    Spacer()
                }
            }            
//        }
    }
}

struct RestaurantsFooter: View {
    @State public var imgRestaurant:String = ""
    @State public var title:String = ""
    @State public var stars:String = ""
    @State private var showDetails:Bool = false
    var body: some View {
        Button(action: {
            showDetails = true
        }, label: {
            VStack{
                Image(imgRestaurant)
                    .resizable()
                    .frame(width: 150)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(title)
                        .font(.caption)
                        .bold()
                        .foregroundColor(Color.black)
                    HStack{
                        Image(systemName: "star.fill")
                            .font(.system(size: 10))
                            .foregroundColor(Color.orange)
                        Text(stars)
                            .foregroundColor(Color(hex: "004422"))
                            .bold()
                    }
                }
            }
            Spacer()
        })
        .navigationDestination(isPresented: $showDetails){
            RestaurantDetail()
        }
    }
}

struct RestaurantDetail: View {
    @State private var showReservation:Bool = false
    var body: some View {
        ZStack(alignment: .bottomLeading){
            ScrollView{
                Image("restaurant1detail")
                    .resizable()
                    .frame(width: .infinity)
                VStack(alignment: .leading){
                    HStack{
                        Text("Restaurant Name Detail")
                            .font(.title)
                            .fontWeight(.medium)
                        Spacer()
                        ForEach(0..<5){star in
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.orange)
                        }
                    }
                    HStack{
                        Image(systemName: "pin.fill")
                        Text("1,2 Km from location")
                            .font(.caption)
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("View on Google Maps")
                                .foregroundColor(Color.purple)
                                .font(.caption)
                        }
                        
                    }
                    Text("Description")
                        .font(.title2)
                        .padding(.vertical)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    Text("Facilities")
                        .font(.title2)
                        .padding(.vertical)
                    ForEach(0..<4){facility in
                        HStack {
                            Image(systemName: "checkmark")
                                .foregroundColor(Color.gray)
                            Text("Snack bar \(facility)")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                        }.padding(.vertical, 1)
                    }
                    Text("You might also like")
                        .font(.title2)
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<5){ index in
                                RestaurantsFooter(imgRestaurant: "restaurant1", title: "Restaurant name \(index)", stars: "4.8")
                            }
                        }
                    }
                }
                .padding(.horizontal,20)
                Spacer()
                    .padding(.vertical,20)
            }
            
            Button (action:{
                showReservation = true
            }){
                Text("View Available Tables")
                    .font(.headline)
            }
            .buttonStyle(GradientButton())
            .padding(.horizontal, 40)
            .navigationDestination(isPresented: $showReservation){
                ReservationTable()
            }
        }
    }
}

#Preview {
    RestaurantDetail()
}
