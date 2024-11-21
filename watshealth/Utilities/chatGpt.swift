import SwiftUI

enum AppPage {
    case home
    case profile
    case settings
}

struct MainView: View {
    @State private var currentPage: AppPage = .home
    
    var body: some View {
        VStack {
            // Display the current page
            ViewBuilderForPage(currentPage: currentPage, navigate: { newPage in
                currentPage = newPage
            })
            
            Spacer()
            
            // Navigation buttons
            HStack {
                Button(action: {
                    currentPage = .home
                }) {
                    Text("Home")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    currentPage = .profile
                }) {
                    Text("Profile")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Button(action: {
                    currentPage = .settings
                }) {
                    Text("Settings")
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

struct ViewBuilderForPage: View {
    let currentPage: AppPage
    let navigate: (AppPage) -> Void
    
    var body: some View {
        switch currentPage {
        case .home:
            HomePage(navigate: navigate)
        case .profile:
            ProfilePage(navigate: navigate)
        case .settings:
            SettingsPage(navigate: navigate)
        }
    }
}

// Example Pages
struct HomePage: View {
    let navigate: (AppPage) -> Void
    var body: some View {
        VStack {
            Text("Welcome to Home Page")
                .font(.largeTitle)
            Button(action: {
                navigate(.profile)
            }) {
                Text("Go to Profile")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct ProfilePage: View {
    let navigate: (AppPage) -> Void
    var body: some View {
        VStack {
            Text("Welcome to Profile Page")
                .font(.largeTitle)
            Button(action: {
                navigate(.settings)
            }) {
                Text("Go to Settings")
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct SettingsPage: View {
    let navigate: (AppPage) -> Void
    var body: some View {
        VStack {
            Text("Welcome to Settings Page")
                .font(.largeTitle)
            Button(action: {
                navigate(.home)
            }) {
                Text("Go to Home")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}

#Preview {
    MainView()
}
