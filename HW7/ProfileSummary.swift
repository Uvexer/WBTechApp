import SwiftUI

struct ContentView7: View {
    @Environment(ModelData.self) var modelData
    @State private  var isEditViewPresented = false
    @State  var profile: Profile
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("Notifications: \(profile.prefersNotifications ? "On" : "Off")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                Divider()
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView {
                    HStack {
                        HikeBadge(name: "First Hike")
                        HikeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                    .padding(.bottom)
                }
            }
            .navigationBarItems(trailing:
                Button(action: {
                    isEditViewPresented.toggle()
                }) {
                    Text("Edit")
                }
            )
            .sheet(isPresented: $isEditViewPresented) {
                EditView(profile: $profile)
            }
        }
    }
}

#Preview {
    ContentView7(profile: .default)
        .environment(ModelData())
}
