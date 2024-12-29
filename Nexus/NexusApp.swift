import SwiftUI

@main
struct NexusApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView() // Start the app with the tab bar
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            // Home Tab - Show ContentView
            NavigationView {
                ContentView() // Your existing Home view
            }
            .tabItem {
                Image(systemName: "house.fill") // Tab icon for Home
                Text("Home")
            }
            
            // Notifications Tab
            NavigationView {
                NotificationsView() // New Notifications view
            }
            .tabItem {
                Image(systemName: "bell.fill") // Tab icon for Notifications
                Text("Notifications")
            }
            
            // Bill Tab
            NavigationView {
                BillView() // New Bill view
            }
            .tabItem {
                Image(systemName: "creditcard.fill") // Tab icon for Bill
                Text("Bill")
            }
            
            // Profile Tab
            NavigationView {
                ProfileView() // New Profile view
            }
            .tabItem {
                Image(systemName: "person.fill") // Tab icon for Profile
                Text("Profile")
            }
        }
    }
}

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("Notifications View")
            // Add notification content here
        }
        .navigationTitle("Notifications")
    }
}

struct BillView: View {
    var body: some View {
        VStack {
            Text("Bill View")
            // Add bill content here
        }
        .navigationTitle("Bill")
    }
}

struct ProfileView: View {
    var body: some View {
        VStack {
            Text("Profile View")
            // Add profile content here
        }
        .navigationTitle("Profile")
    }
}
