//
//  Payment.swift
//  watshealth
//
//  Created by mac on 11/8/24.
//

import SwiftUI

struct Payment: View {
    @State private var selectedTab: PaymentMethod = .qris // Tracks the selected tab
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack() {
            HStack(spacing: 0) {
//                TabItemView(icon: "hand.palm.facing", label: "Cash", isSelected: selectedTab == .cash)
//                    .onTapGesture {
//                        selectedTab = .cash
//                    }
                TabItemView(icon: "creditcard", label: "Card", isSelected: selectedTab == .masterCard)
                    .onTapGesture {
                        selectedTab = .masterCard
                    }
                TabItemView(icon: "qrcode", label: "QRIS", isSelected: selectedTab == .qris)
                    .onTapGesture {
                        selectedTab = .qris
                    }
            }            
            if selectedTab == .cash {
                cash()
            }else if selectedTab == .masterCard {
                masterCard()
            } else {
                qris()
            }
            VStack{
                LabelDescriptionView(label: "Total", description: "Rp. 28.000")
                    .previewLayout(.sizeThatFits)
                    .bold()
                Spacer()
                Button (action:{
                    viewRouter.currentPage = .dashboard
                    viewRouter.numberOfPage = 5
                }){
                    Text("Pay and Confirm")
                        .font(.headline)
                }
                .buttonStyle(GradientButton())
                .padding(.horizontal, 20)
            }
            .cornerRadius(10)
        }
    }
}

struct qris:View {
    var body: some View {
        VStack {
            VStack {
                Image("qris")
                    .resizable()
                    .frame(width: 280, height: 220)
                    .padding()
//                Text("QR Code was accepted by")
//                    .font(.title3)
//                    .padding()
                HStack{
                    iconQris(iconName: "wallet.bifold", title: "Wallet A", colorHex: "529CE0")
                    iconQris(iconName: "wallet.bifold", title: "Wallet B", colorHex: "34AA12")
                    iconQris(iconName: "wallet.bifold", title: "Wallet C", colorHex: "FF8610")
                }
                Spacer()
            }
            .padding()
            .background(Color(hex: "F7F8F9"))
            .cornerRadius(10)
            Button(action: {}){
                HStack{
                    Image(systemName: "square.and.arrow.down")
                    Text("Download Qris")
                }
            }
            .buttonStyle(FlatButton())
            .padding(.horizontal, 30)
        }
        .frame(maxHeight: .infinity)
    }
}

struct masterCard:View {
    var body: some View {
        VStack {
            VStack {
                Image("blankCard")
                    .resizable()
                    .frame(width: 310, height: 160)
                    .padding()
                Text("No master card added")
                    .font(.title3)
                    .bold()
                    .padding()
                Text("You can add a mastercard and save it for later")
                    .font(.callout)
                    .frame(width: 220, height: 80)
                    .multilineTextAlignment(.center)
            }
            .background(Color(hex: "F7F8F9"))
            .cornerRadius(10)
            Button(action: {}){
                HStack{
                    Image(systemName: "plus.app")
                    Text("ADD NEW CARD")
                }
            }
            .buttonStyle(FlatButton())
            .padding(.horizontal, 30)
        }
        .frame(maxHeight: .infinity)
        Spacer()
    }
}

struct cash:View{
    var body: some View{
        VStack {
            VStack {
                Text("Please complete your transaction at Cashier")
                    .font(.title3)
                    .bold()
                    .frame(width: 310, height: 80)
                    .multilineTextAlignment(.center)
            }
            .padding()
            .background(Color(hex: "F7F8F9"))
            .cornerRadius(10)
        }
        .frame(maxHeight: .infinity)
        Spacer()
            .padding(.vertical,40)
    }
}

struct iconQris:View{
    let iconName: String
    let title:String
    let colorHex:String
    var body: some View{
        VStack{
            Image(systemName: iconName)
                .font(.title)
            Text(title)
                .font(.caption2)
        }
        .foregroundColor(Color(hex: colorHex))
        .padding(.horizontal,22)
    }
}

enum PaymentMethod {
    case cash
    case masterCard
    case qris
}


#Preview {
    Dashboard()
        .environmentObject(ViewRouter())
}
