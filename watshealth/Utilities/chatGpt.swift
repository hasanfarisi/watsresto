import SwiftUI

//struct PaymentTabView: View {
//    @State private var selectedTab: PaymentMethod = .cash // Tracks the selected tab
//
//    var body: some View {
//        VStack {
//            HStack(spacing: 20) {
//                // Cash Tab
//                TabItemView(icon: "hand.point.right.fill", label: "Cash", isSelected: selectedTab == .cash)
//                    .onTapGesture {
//                        selectedTab = .cash
//                    }
//
//                // MasterCard Tab
//                TabItemView(icon: "creditcard.fill", label: "MasterCard", isSelected: selectedTab == .masterCard)
//                    .onTapGesture {
//                        selectedTab = .masterCard
//                    }
//            }
//            .padding(.top)
//
//            // Display content based on selected tab
//            Spacer()
//            if selectedTab == .cash {
//                Text("Cash Payment Selected")
//                    .font(.title)
//                    .padding()
//            } else {
//                Text("MasterCard Payment Selected")
//                    .font(.title)
//                    .padding()
//            }
//            Spacer()
//        }
//    }
//}
//
//enum PaymentMethod {
//    case cash
//    case masterCard
//}
//
//struct TabItemView: View {
//    var icon: String
//    var label: String
//    var isSelected: Bool
//
//    var body: some View {
//        ZStack(alignment: .topTrailing) {
//            VStack {
//                Image(systemName: icon)
//                    .font(.largeTitle)
//                    .foregroundColor(isSelected ? .blue : .gray)
//                Text(label)
//                    .foregroundColor(isSelected ? .blue : .gray)
//                    .font(.headline)
//            }
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2) // Border when selected
//            )
//            
//            // Checkmark for selected tab
//            if isSelected {
//                Image(systemName: "checkmark.circle.fill")
//                    .foregroundColor(.green)
//                    .offset(x: 10, y: -10)
//            }
//        }
//        .frame(width: 120, height: 100) // Adjust size as needed
//    }
//}

//struct PaymentTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        PaymentTabView()
//            .previewLayout(.sizeThatFits)
//    }
//}
