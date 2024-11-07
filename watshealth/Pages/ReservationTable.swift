//
//  ReservationTable.swift
//  watshealth
//
//  Created by mac on 11/7/24.
//

import SwiftUI

struct ReservationTable: View {
    @State private var isMainRoom: Bool = true
    @State private var selectedTable: Int? = nil
    @State private var showReservation:Bool = false
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Button(action: {
                    isMainRoom = true
                }) {
                    Text("Main room")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(isMainRoom ? Color(hex: "#009944") : Color.clear)
                        .foregroundColor(isMainRoom ? .white : .primary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Button(action: {
                    isMainRoom = false
                }) {
                    Text("Open Space")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .background(!isMainRoom ? Color(hex: "#009944") : Color.clear)
                        .foregroundColor(!isMainRoom ? .white : .primary)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 40)
            Spacer()
            
            ZStack(alignment: .bottomLeading){
                // Room Layout
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(1..<4, id: \.self) { table in
                            HStack(spacing: 20) {
                                if (selectedTable != table){
                                    Image("tableLeft")
                                        .overlay(Text("\(table)").foregroundColor(selectedTable != table ? .primary : .white))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }else{
                                    Image("tableLeftSelected")
                                        .overlay(Text("\(table)").foregroundColor(selectedTable != table ? .primary : .white))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }
                                if (selectedTable != table){
                                    Image("mainTable")
                                        .overlay(Text("\(table)").foregroundColor(selectedTable != table ? .primary : .white))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }else{
                                    Image("mainTableSelected")
                                        .overlay(Text("\(table)").foregroundColor(selectedTable != table ? .primary : .white))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }
                                if (selectedTable != table){
                                    Image("tableRight")
                                        .overlay(Text("\(table)").foregroundColor(selectedTable != table ? .primary : .white))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }else{
                                    Image("tableRightSelected")
                                        .overlay(Text("\(table)").foregroundColor(selectedTable != table ? .primary : .white))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }
                            }
                            .padding(.vertical,10)
                        }
                        VStack(alignment: .leading, spacing: 20) {
                            Text("Description")
                                .font(.title2)
                                .padding(.vertical)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi")
                                .font(.callout)
                                .foregroundColor(Color.gray)
                            Text("Facilities")
                                .font(.title2)
                                .padding(.vertical)
                            ForEach(0..<4){facility in
                                HStack {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(Color.gray)
                                    Text("Snack bar \(facility)")
                                        .font(.callout)
                                        .foregroundColor(Color.gray)
                                }.padding(.vertical, 1)
                            }
                        }
                        .padding(.horizontal,10)
                    }
                    .padding()
                }
            }
            Button (action:{
                showReservation = true
            }){
                Text("Reserve the Table")
                    .font(.headline)
            }
            .buttonStyle(GradientButton())
            .padding(.horizontal, 40)
            .navigationDestination(isPresented: $showReservation){
                ReservedComplete()
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    ReservationTable()
}
