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
                TabItemView(icon: "hand.palm.facing", label: "Cash", isSelected: selectedTab == .cash)
                    .onTapGesture {
                        selectedTab = .cash
                    }
                TabItemView(icon: "creditcard", label: "Card", isSelected: selectedTab == .masterCard)
                    .onTapGesture {
                        selectedTab = .masterCard
                    }
                TabItemView(icon: "qrcode", label: "QRIS", isSelected: selectedTab == .qris)
                    .onTapGesture {
                        selectedTab = .qris
                    }
            }
            .padding(.top)
            Spacer()
            if selectedTab == .cash {
                Text("Cash Payment Selected")
                    .font(.title)
                    .padding()
            }else if selectedTab == .masterCard {
                Text("Card Payment Selected")
                    .font(.title)
                    .padding()
            } else {
                VStack {
                    VStack {
                        Text("Scan for Payment")
                            .font(.title2)
                            .bold()
                            .padding()
                        Image("qris")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding()
                        Text("QR Code was accepted by")
                            .font(.title3)
                            .padding()
                        HStack{
                            VStack{
                                Image(systemName: "wallet.bifold.fill")
                                    .font(.title)
                                Text("Wallet a")
                                    .font(.callout)
                            }
                            .foregroundColor(Color.blue)
                            VStack{
                                Image(systemName: "wallet.bifold")
                                    .font(.title)
                                Text("Wallet b")
                                    .font(.callout)
                            }
                            .foregroundColor(Color.orange)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color(hex: "F7F8F9"))
                    .cornerRadius(10)
                    VStack{
                        LabelDescriptionView(label: "Total", description: "Rp. 28.000")
                                    .previewLayout(.sizeThatFits)
                                    .bold()
                        Spacer()
                        Button (action:{
                            viewRouter.numberOfPage = 5
                            viewRouter.currentPage = .dashboard
                        }){
                            Text("Pay and Confirm")
                                .font(.headline)
                        }
                        .buttonStyle(GradientButton())
                        .padding(.horizontal, 20)
                    }
                    .padding()
                    .cornerRadius(10)
                }
                .frame(maxHeight: .infinity)
                Spacer()
            }
            Spacer()
        }
    }
}

enum PaymentMethod {
    case cash
    case masterCard
    case qris
}

//struct qris:View {
//    var body: some View {
////        VStack {
////            VStack {
////                Text("Scan for Payment")
////                    .font(.title2)
////                    .bold()
////                    .padding()
////                Image("qris")
////                    .resizable()
////                    .frame(width: 200, height: 200)
////                    .padding()
////                Text("QR Code was accepted by")
////                    .font(.title3)
////                    .padding()
////                HStack{
////                    VStack{
////                        Image(systemName: "wallet.bifold.fill")
////                            .font(.title)
////                        Text("Wallet a")
////                            .font(.callout)
////                    }
////                    .foregroundColor(Color.blue)
////                    VStack{
////                        Image(systemName: "wallet.bifold")
////                            .font(.title)
////                        Text("Wallet b")
////                            .font(.callout)
////                    }
////                    .foregroundColor(Color.orange)
////                }
////                Spacer()
////            }
////            .padding()
////            .background(Color(hex: "F7F8F9"))
////            .cornerRadius(10)
////            VStack{
////                LabelDescriptionView(label: "Total", description: "Rp. 28.000")
////                            .previewLayout(.sizeThatFits)
////                            .bold()
////                Spacer()
////                Button (action:{
////                    viewRouter.numberOfPage = 5
////                    viewRouter.currentPage = .dashboard
////                }){
////                    Text("Pay and Confirm")
////                        .font(.headline)
////                }
////                .buttonStyle(GradientButton())
////                .padding(.horizontal, 20)
////            }
////            .padding()
////            .cornerRadius(10)
////        }
////        .frame(maxHeight: .infinity)
////        Spacer()
//    }
//}

#Preview {
    Payment()
        .environmentObject(ViewRouter())
}
