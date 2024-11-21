
import SwiftUI

struct Dashboard: View {
    @EnvironmentObject var viewRouter: ViewRouter

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    print("Menu tapped")
                }) {
                    Image(systemName: "line.horizontal.3")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                Spacer()
                
                HStack{
                    Image("vector2")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                    Image("watsresto")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 40)
                }
                
                Spacer()
                
                Button(action: {
                    viewRouter.numberOfPage = 4 //Profile
                    viewRouter.currentPage = .dashboard
                }) {
                    Image("profile")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                }
            }
            .padding()
            
            switch viewRouter.numberOfPage {
            case 0:
                Home()
            case 1:
                FoodsIndex()
            case 12:
                FoodDetail()                    
            case 2:
                RestaurantsIndex()
            case 3:
                Cart()
            case 4:
                Profile()
            case 5:
                OrderComplete()
            case 6:
                Login()
            case 7:
                Payment()
            default:
                Home()
            }            
            
            TabView(selection: $viewRouter.numberOfPage) {
                Text("")
                    .tabItem {
                        Image(systemName: "house")
                            .frame(width: 30)
                        Text("Home")
                    }
                    .tag(0)
                
                Text("")
                    .tabItem {
                        Image(systemName: "fork.knife")
                            .frame(width: 30)
                        Text("Foods")
                    }
                    .tag(1)
                
                Text("")
                    .tabItem {
                        Image(systemName: "building.columns")
                            .frame(width: 30)
                        Text("Restaurants")
                    }
                    .tag(2)
                
                Text("")
                    .tabItem {
                        Image(systemName: "cart.fill")
                            .frame(width: 30)
                        Text("Cart")
                    }
                    .tag(3)
            }
            .frame(height: 90)
        }.ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    Dashboard()
        .environmentObject(ViewRouter())
}
