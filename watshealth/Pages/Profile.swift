//
//  Profile.swift
//  watshealth
//
//  Created by mac on 11/7/24.
//

import SwiftUI

struct Profile: View {
    @State private var isOn = false
    var body: some View {
        NavigationStack{
            ImageBackground()
                .overlay(
                    VStack{
                        Spacer()
                            .padding(.horizontal)
                        ZStack{
                            Image("profile")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(Circle())
                                .overlay(
                                    Circle()
                                        .stroke(Color(hex: "#A7D3BB"), lineWidth: 10) // Custom color border with 5 width
                                )
                            Button(action: {
                                // Your action here
                            }) {
                                Image(systemName: "applepencil.gen1")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 30, height: 30)
                            .background(Color(hex: "009944"))
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 2) // Custom color border with 5 width
                            )
                            .offset(x: 30, y: 40)
                        }
                        .padding(.vertical,20)
                        Spacer()
                        ZStack(alignment: .leading){
//                            RoundedRectangle(cornerRadius: 16)
//                                .fill(Color.white)
//                                .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 5)
//                                .frame(height: 250)
                            VStack(alignment: .leading){
                                Text("Personal Info")
                                    .font(.title2)
                                    .bold()
                                VStack(alignment: .leading){
                                    LabelDescriptionView(label: "Name", description: "Risyad")
                                        .previewLayout(.sizeThatFits)
                                    LabelDescriptionView(label: "Occupation", description: "Student")
                                        .previewLayout(.sizeThatFits)
                                    LabelDescriptionView(label: "Address", description: "Palangkaraya")
                                        .previewLayout(.sizeThatFits)
                                }
                                Text("Contact Info")
                                    .font(.title2)
                                    .bold()
                                VStack(alignment: .leading){
                                    LabelDescriptionView(label: "Phone number", description: "+62 82127662477")
                                                .previewLayout(.sizeThatFits)
                                    LabelDescriptionView(label: "Email", description: "risyad@gmail.com")
                                                .previewLayout(.sizeThatFits)
                                    }
                                Spacer()
                               }
                                .padding()
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                        Button (action:{
//                            showReservation = true
                        }){
                            Text("Edit")
                                .font(.headline)
                        }
                        .buttonStyle(GradientButton())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 50)
//                        .navigationDestination(isPresented: $showReservation){
//                            ReservationTable()
//                        }
                    }
                )
        }
            
    }
}

#Preview {
    Profile()
}
