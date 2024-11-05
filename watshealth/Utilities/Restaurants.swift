//
//  Restaurants.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct Restaurants: View {
    @State public var imgRestaurant:String = ""
    @State public var title:String = ""
    @State public var stars:String = ""
    var body: some View {
        Button(action: {
            
        }, label: {
            VStack{
                Image(imgRestaurant)
                    .resizable()
                    .frame(width: 150)
                    .scaledToFit()
                VStack(alignment: .leading){
                    Text(title)
                        .font(.title3)
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
    }
}
