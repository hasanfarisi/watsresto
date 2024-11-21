//
//  Profile.swift
//  watshealth
//
//  Created by mac on 11/7/24.
//

import SwiftUI

struct Profile: View {
    @State private var isOn = false
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationStack{
            ImageBackground()
                .overlay(
                    VStack{
                        Spacer()
                            .padding(.vertical)
                        ProfilePicture()
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
                                    LabelDescriptionView(label: "Phone number", description: "+62 86778659908")
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
                            viewRouter.numberOfPage = 41
                            viewRouter.currentPage = .dashboard
                        }){
                            Text("Edit")
                                .font(.headline)
                        }
                        .buttonStyle(GradientButton())
                        .padding(.horizontal, 40)
                        Button(action: {
                            viewRouter.numberOfPage = 0
                            viewRouter.currentPage = .dashboard
                        }){
                            Text("Back")
                                .font(.headline)
                        }
                        .buttonStyle(FlatButton())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        Spacer()
                    }
                )
        }
            
    }
}

struct ProfileForm: View {
    @State private var name: String = ""
    @State private var occupation: String = ""
    @State private var address: String = ""
    @State private var phone: String = ""
    @State private var email: String = ""
    @EnvironmentObject var viewRouter: ViewRouter
    
    var body: some View {
        NavigationStack{
            ImageBackground()
                .overlay(
                    VStack{
                        Spacer()
                            .padding(.vertical)
                        ProfilePicture()
                        Spacer()
                        ZStack(alignment: .leading){
                            VStack(alignment: .leading){
                                Text("Personal Info")
                                    .font(.title2)
                                    .bold()
                                VStack(alignment: .leading){
                                    CustomTextField(label: "Name", text: $name, icon: "person")
                                        .padding(.vertical, 5)
                                    CustomTextField(label: "Occupation", text: $occupation, icon: "book")
                                        .padding(.vertical, 5)
                                    CustomTextField(label: "Address", text: $address, icon: "location")
                                        .padding(.vertical, 5)
                                }
                                Text("Contact Info")
                                    .font(.title2)
                                    .bold()
                                VStack(alignment: .leading){
                                    CustomTextField(label: "Phone number", text: $phone, icon: "phone")
                                        .padding(.vertical, 5)
                                    CustomTextField(label: "Email", text: $email, icon: "mail")
                                        .padding(.vertical, 5)
                                }
                                Spacer()
                               }
                                .padding()
                        }
                        .padding(.horizontal, 20)
                        Spacer()
                        Button (action:{
                            viewRouter.currentPage = .dashboard
                            viewRouter.numberOfPage = 4
                        }){
                            Text("Save")
                                .font(.headline)
                        }
                        .buttonStyle(GradientButton())
                        .padding(.horizontal, 40)
                        Button(action: {
                            viewRouter.numberOfPage = 0
                            viewRouter.currentPage = .dashboard
                        }){
                            Text("Back")
                                .font(.headline)
                        }
                        .buttonStyle(FlatButton())
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        Spacer()

                    }
                )
        }
    }
}

struct ProfilePicture:View {
    var body: some View {
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
    }
}
#Preview {
    ProfileForm()
}
