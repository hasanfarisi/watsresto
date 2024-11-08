//
//  Cart.swift
//  watshealth
//
//  Created by mac on 11/6/24.
//

import SwiftUI

struct Cart: View {
    @State private var isOrderComplete:Bool = false
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("Order details")
                            .font(.title2)
                        Spacer()
                        Text("10 Items")
                            .font(.caption)
                    }
                    .padding(.horizontal,20)
                    .padding(.vertical, 20)
                    ForEach(0..<4){index in
                        CartMeal(index: index)
                    }
                }
            }
            Spacer()
            ZStack{
                Image("placeCart")
                    .frame(height: 200)
                VStack(alignment: .leading){
                    HStack{
                        Text("Sub total")
                        Spacer()
                        Text("Rp. 1.250.000")
                    }
                    .padding(.horizontal,20)
                    HStack{
                        Text("Delivery charge")
                        Spacer()
                        Text("Rp. 10.000")
                    }
                    .padding(.horizontal,20)
                    HStack{
                        Text("Discount")
                        Spacer()
                        Text("Rp. 0")
                    }
                    .padding(.horizontal,20)
                    HStack{
                        Text("Total")
                        Spacer()
                        Text("Rp. 1.250.000")
                    }
                    .bold()
                    .font(.title3)
                    .padding(.horizontal,20)
                    .padding(.vertical,10)
                    Button(action: {
                        isOrderComplete = true
                    }){
                        Text("Place My Order")
                            .font(.callout)
                    }
                    .buttonStyle(FlatButton())
                    .padding(10)
                    .navigationDestination(isPresented: $isOrderComplete){
                        Payment()
                            .environmentObject(ViewRouter())
                    }
                }
                .padding(.horizontal,20)
                .foregroundColor(Color.white)
            }
        }
    }
}

struct CartMeal:View {
    let index:Int
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                .frame(height: 100)
            VStack(alignment: .leading){
                HStack{
                    Image("menu3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .cornerRadius(10)
                    Spacer()
                    VStack(alignment: .leading){
                        Text("Pizza Chicken \(index)")
                        Text("Restaurant Name \(index)")
                            .font(.caption)
                        HStack{
                            Text("Rp")
                                .font(.caption2)
                            Text("28.000")
                                .font(.callout)
                        }
                    }
                    Spacer()
                    HStack{
                        Button(action: {}){
                            Image(systemName: "minus")
                                .frame(height: 5)
                                .font(.system(size: 10))
                        }
                        .buttonStyle(FlatButton())
                        Text("1")
                        Button(action: {}){
                            Image(systemName: "plus")
                                .frame(height: 5)
                                .font(.system(size: 10))
                        }
                        .buttonStyle(GradientButton())
                        
                    }
                }
            }
            .padding()
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    Cart()
}
