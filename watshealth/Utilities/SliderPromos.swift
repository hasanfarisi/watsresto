//
//  SliderPromos.swift
//  watshealth
//
//  Created by mac on 11/5/24.
//

import SwiftUI

struct SliderPromos: View {
    @State private var currentIndex = 0
    @State var promos:Array = [""]
    private let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()
    
    var body: some View{
        TabView(selection: $currentIndex){
            ForEach(0..<promos.count) { index in
                Image(promos[index])
                    .resizable()
                    .scaledToFill()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .animation(.easeIn(duration: 1), value: currentIndex)
        .onReceive(timer){ _ in
            withAnimation{
                currentIndex = (currentIndex + 1) % promos.count
            }
        }
        .frame(height: 150)
        .cornerRadius(10)
    }
}

#Preview {
    SliderPromos(promos: [""])
}
