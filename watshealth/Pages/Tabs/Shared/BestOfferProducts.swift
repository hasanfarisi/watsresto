//
//  BestOfferProducts.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct BestOfferProducts: View {
    @State public var imgMenu:String = ""
    @State public var title:String = ""
    @State public var detail:String = ""
    @State public var price:String = ""
    var body: some View {
            Button(action: {
                
            }, label: {
                VStack{
                    Image(imgMenu)
                        .shadow(radius: 1)
                    VStack{
                        Text(title)
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color.black)
                        Text(detail)
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        HStack{
                            Text("Rp")
                                .font(.system(size: 10))
                                .foregroundColor(Color.gray)
                            Text(price)
                                .foregroundColor(Color(hex: "004422"))
                                .bold()
                        }
                    }
                }
                Spacer()
            })
    }
}
