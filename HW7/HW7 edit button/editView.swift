import SwiftUI
struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var profile: Profile
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile")) {
                    TextField("Username", text: $profile.username)
                    Toggle(isOn: $profile.prefersNotifications) {
                        Text("Enable Notifications")
                    }
                    Picker("Seasonal Photo", selection: $profile.seasonalPhoto) {
                        ForEach(Profile.Season.allCases) { season in
                            Text(season.rawValue).tag(season)
                        }
                    }
                    DatePicker("Goal Date", selection: $profile.goalDate, displayedComponents: .date)
                }
            }
            .navigationBarTitle("Edit Profile", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }
            )
        }
    }
}
