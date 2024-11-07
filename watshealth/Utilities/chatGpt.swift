import SwiftUI

struct ContentViews: View {
    @State private var isMainRoom: Bool = true
    @State private var selectedTable: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // Header
                HStack {
                    Button(action: {
                        // Hamburger action
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Image("your_logo") // Replace with actual logo name
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                    
                    Spacer()
                    
                    Button(action: {
                        // Profile action
                    }) {
                        Image("profile_photo") // Replace with actual profile photo name
                            .resizable()
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                    }
                }
                .padding()
                .background(Color.white)
                
                // Room Toggle with unified background
                HStack(spacing: 0) {
                    Button(action: {
                        isMainRoom = true
                    }) {
                        Text("Main room")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(isMainRoom ? Color.green : Color.clear)
                            .foregroundColor(isMainRoom ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    
                    Button(action: {
                        isMainRoom = false
                    }) {
                        Text("Open Space")
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(!isMainRoom ? Color.green : Color.clear)
                            .foregroundColor(!isMainRoom ? .white : .primary)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
                .padding(.horizontal)
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.horizontal)
                
                // Room Layout
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(1..<10, id: \.self) { table in
                            HStack(spacing: 20) {
                                ForEach(1..<4, id: \.self) { seat in
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(selectedTable == table ? Color.green : Color.gray.opacity(0.2))
                                        .frame(width: 50, height: 50)
                                        .overlay(Text("\(seat)").foregroundColor(.primary))
                                        .onTapGesture {
                                            selectedTable = table
                                        }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                // Description Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .padding()
                
                // Facilities Section
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        FacilityItem(iconName: "checkmark", title: "Snack bar")
                        Spacer()
                        FacilityItem(iconName: "checkmark", title: "Toilet")
                    }
                    HStack {
                        FacilityItem(iconName: "checkmark", title: "Bikes and Car Parking")
                        Spacer()
                        FacilityItem(iconName: "checkmark", title: "24/7 Water facility")
                    }
                }
                .padding(.horizontal)
                
                // Reserve Button
                Button(action: {
                    // Reserve action
                }) {
                    Text("Reserve the Table")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
            .background(Color(.systemGray6))
            .navigationBarHidden(true)
        }
    }
}

struct FacilityItem: View {
    var iconName: String
    var title: String
    
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: iconName)
                .foregroundColor(.gray)
            Text(title)
                .font(.callout)
                .foregroundColor(.gray)
        }
    }
}



#Preview {
    ContentViews()
}
