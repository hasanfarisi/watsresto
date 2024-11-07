//
//  OrderComplete.swift
//  watshealth
//
//  Created by mac on 11/7/24.
//

import SwiftUI

struct OrderComplete: View {
    @State private var feedback:String = ""
    @State private var isShowing:Bool = false
    var body: some View {
        NavigationStack{
            ImageBackground()
                .overlay(
                    VStack{
                        Image("iconCheck")
                        Text("Text You!")
                            .font(.largeTitle)
                            .foregroundColor(Color(hex: "004422"))
                        Text("Order Completed")
                            .font(.largeTitle)
                            .foregroundColor(Color(hex: "004422"))
                        HStack{
                            ForEach(0..<5){star in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color.orange)
                                    .font(.system(size: 25))
                            }
                        }
                        .padding(.vertical)
                        CustomTextField(label: "Leave feedback", text: $feedback, icon: "square.and.pencil", isSecure: false)
                            .padding(.horizontal, 30)
                            .padding(.vertical)
                        HStack{
                            Button(action: {
                            }){
                                Text("Submit")
                                    .font(.callout)
                            }
                            .buttonStyle(GradientButton())
                            .frame(width: 200)
                            Spacer()
                            Button(action: {
                                isShowing = true
                            }){
                                Text("Skip")
                                    .font(.callout)
                            }
                            .buttonStyle(FlatButton())
                            .frame(width: 100)
                            .navigationDestination(isPresented: $isShowing){
                                Dashboard(selectedTab: 0)
                                    .navigationBarBackButtonHidden(true)
                            }
                        }
                        .padding(.horizontal, 30)
                    }
                )
        }
    }
}

struct ReservedComplete:View {
    @State private var showFood:Bool = false
    var body: some View {
        NavigationStack{
            ImageBackground()
                .overlay(
                    VStack{
                        Image("reservedComplete")
                        Text("Your Table was")
                            .font(.largeTitle)
                            .foregroundColor(Color(hex: "004422"))
                        Text("Reserved Successfully!")
                            .font(.largeTitle)
                            .foregroundColor(Color(hex: "004422"))
                        Text("Please respect our policies and do come to your reserved Table within the specified* time!")
                            .font(.caption)
                            .padding(.horizontal)
                        
                        Button (action:{
                            showFood = true
                        }){
                            Text("Order Food")
                                .font(.headline)
                        }
                        .buttonStyle(GradientButton())
                        .padding(.horizontal, 40)
                        .padding(.vertical)
                        .navigationDestination(isPresented: $showFood){
                            Dashboard(selectedTab: 3)
                                .navigationBarBackButtonHidden(true)
                        }
                    }
                )
        }
    }
}

#Preview {
    ReservedComplete()
}
