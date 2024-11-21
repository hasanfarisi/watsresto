//
//  OrderComplete.swift
//  watshealth
//
//  Created by mac on 11/7/24.
//

import SwiftUI

struct OrderComplete: View {
    @State private var feedback:String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
//        NavigationStack{
            ImageBackground()
                .overlay(
                    VStack{
                        Image("iconCheck")
                        Text("Thank You!")
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
                                viewRouter.currentPage = .dashboard
                                viewRouter.numberOfPage = 0
                            }){
                                Text("Submit")
                                    .font(.callout)
                            }
                            .buttonStyle(GradientButton())
                            .frame(width: 200)
                            Spacer()
                            Button(action: {
                                viewRouter.currentPage = .dashboard
                                viewRouter.numberOfPage = 0
                            }){
                                Text("Skip")
                                    .font(.callout)
                            }
                            .buttonStyle(FlatButton())
                            .frame(width: 100)
                        }
                        .padding(.horizontal, 30)
                    }
                )
//        }
    }
}

struct ReservedComplete:View {
    @EnvironmentObject var viewRouter: ViewRouter
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
                            viewRouter.currentPage = .dashboard
                            viewRouter.numberOfPage = 0
                        }){
                            Text("Order Food")
                                .font(.headline)
                        }
                        .buttonStyle(GradientButton())
                        .padding(.horizontal, 40)
                        .padding(.vertical)
                    }
                )
        }
    }
}

#Preview {
    OrderComplete()
}
