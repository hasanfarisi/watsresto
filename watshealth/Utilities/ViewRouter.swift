import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .main
    @Published var numberOfPage: Int = 0
    
    enum Page {
        case main
        case dashboard
        case authentication
    }
}
