
import SwiftUI

struct ContactDetailView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    var contact: (String, String, String?, String)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(colorScheme == .dark ? Color(red: 41/255, green: 24/255, blue: 59/255, opacity: 1) : .white)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(colorScheme == .dark ? "vectorDark" : "arrov")
                                    .foregroundColor(.customColoreThree)
                                
                                Text("Профиль")
                                    .font(.system(size: 18, weight: .bold))
                                    .foregroundColor(colorScheme == .dark ? .white : .customColoreOne)
                                
                                Spacer()
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Image(colorScheme == .dark ? "pencilDark" : "pencil")
                                .frame(width: 24, height: 24)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 70)
                    
                    if let imageName = contact.2, let image = UIImage(named: imageName) {
                        Image(uiImage: image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .padding(.bottom, 20)
                    } else {
                        ZStack {
                            Circle()
                                .fill(Color.purple)
                                .frame(width: 200, height: 200)
                            Text(getInitials(from: contact.0))
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                        .padding(.bottom, 20)
                    }
                    
                    Text(contact.0)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(contact.3)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding(.bottom, 20)
                    
                    HStack(spacing: 20) {
                        SocialMediaButton(imageName: "twitter")
                        SocialMediaButton(imageName: "instagram")
                        SocialMediaButton(imageName: "linkedin")
                        SocialMediaButton(imageName: "facebook")
                    }
                    
                    Spacer()
                    
                            Color(colorScheme == .dark ? Color(red: 41/255, green: 24/255, blue: 59/255, opacity: 1) : .white)
                                .edgesIgnoringSafeArea(.all)
                    HStack(spacing: 100) {
                        Image(colorScheme == .dark ? "peopleDark" : "contacts")
                        Image(colorScheme == .dark ? "messageDark" : "message")
                        Image(colorScheme == .dark ? "menuDark" : "menu")
                    }
                    
                }
            }
        }
        .navigationBarHidden(true)
    }
    
    func getInitials(from name: String) -> String {
        let components = name.split(separator: " ")
        let initials = components.compactMap { $0.first }.map { String($0) }.joined()
        return initials
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView(contact: ("Анастасия Иванова", "+7 920 123-45-67", "people1", "Last seen yesterday"))
       
    }
}


