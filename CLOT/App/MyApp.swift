import SwiftUI

@main struct MyApp: App {
    @StateObject private var cart = CartStore()
    var body: some Scene {
        WindowGroup {
            AppRootView().environmentObject(cart)
        }
    }
}
