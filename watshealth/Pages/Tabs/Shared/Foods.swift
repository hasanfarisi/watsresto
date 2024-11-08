//
//  Foods.swift
//  watshealth
//
//  Created by mac on 11/6/24.
//

import SwiftUI

struct FoodsIndex: View {
    @State var categories = ["Chicken", "Burger", "Pizza", "Gado-gado"]
    @State var query: String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        VStack(alignment: .leading){
            CustomTextField(label: "Search for foods", text: $query, icon: "magnifyingglass", isSecure: false)
                .padding(.horizontal, 20)
            ScrollView{
                ForEach(0..<3){category in
                    VStack(alignment: .leading){
                        Text("\(categories[category])")
                            .font(.title2)
                            .padding(.vertical)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0..<10){index in
                                    Meal(index: index)
                                        .environmentObject(viewRouter)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(20)
        }
    }
}

struct FoodDetail: View {
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        ZStack(alignment: .bottomLeading){
            ScrollView{
                Image("menuDetail1")
                    .resizable()                    
                    .frame(height: 250)
                VStack(alignment: .leading){
                    HStack{
                        Button(action: {
                            
                        }){
                            Text("Popular")
                                .font(.headline)
                        }
                        .buttonStyle(FlatButton())
                        .frame(width: 100)
                        Spacer()
                        Image(systemName: "pin.fill")
                            .padding(.horizontal)
                        Image(systemName: "heart.fill")
                    }
                    
                    Text("Chicken Burger Promo Pack")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.vertical)
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.orange)
                        Text("5.0 Rating")
                            .font(.caption)
                        Image(systemName: "lock")
                            .foregroundColor(Color.green)
                        Text("200+ Orders")
                            .font(.caption)
                    }
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi")
                        .font(.callout)
                        .foregroundColor(Color.gray)
                    
                    Text("You might also like")
                        .font(.title2)
                        .padding(.vertical)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<5){ index in
                                Meal(index: index)
                                    .environmentObject(viewRouter)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical)
            }
            Button (action:{
                viewRouter.numberOfPage = 3 //Cart
                viewRouter.currentPage = .dashboard
            }){
                Text("Add to Cart")
                    .font(.headline)
            }
            .buttonStyle(GradientButton())
            .padding(.horizontal, 40)
        }
    }
}

struct Meal:View {
    let index:Int
    @State private var showFoodDetail:Bool = false
    @EnvironmentObject var viewRouter: ViewRouter
    var body: some View {
        Button (action:{
            showFoodDetail = true
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                    .frame(height: 200)
                VStack(alignment: .leading){
                    Image("menu2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                    VStack(alignment: .leading){
                        Text("Menu-\(index)")
                            .bold()
                        HStack{
                            Text("Rp")
                                .font(.caption2)
                            Text("28.000")
                                .font(.callout)
                        }
                        Text("Restaurant-\(index)")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        Spacer()
                    }.padding(.horizontal)
                }
                .foregroundColor(Color.black)
            }
            .frame(width: 150, height: 250)
        }
        .navigationDestination(isPresented: $showFoodDetail){
            FoodDetail()
                .environmentObject(viewRouter)
        }
    }
}

#Preview {
    FoodsIndex()
}
