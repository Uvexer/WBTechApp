import SwiftUI

struct ContentView2: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    var contacts = [
        ("Анастасия Иванова", "Last seen yesterday", "people1", "+7 920 123-45-67"),
        ("Петя", "Online", "people2","+7 915 234-56-78"),
        ("Маман", "Last seen 3 hours ago", "people3", "+7 903 345-67-89"),
        ("Арбуз Дыня", "Online", "people4", "+7 916 456-78-90"),
        ("Иван Иванов", "Online", "people5", "+7 917 567-89-01"),
        ("Лиса Алиса", "Last seen 30 minutes ago", "people6","+7 905 678-90-12")
    ]
    
    var body: some View {
        NavigationView {
            TabView {
                VStack {
                    HStack {
                        Text("Контакты")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(colorScheme == .dark ? .white : .customColoreOne)
                        Image(systemName: "plus")
                            .frame(width: 24, height: 24)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundColor(colorScheme == .dark ? .white : .customColoreOne)
                    }
                    .padding()
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(colorScheme == .dark ? .white : .gray)
                            .padding(.leading, 10)
                        TextField("Search", text: $searchText)
                            .foregroundColor(colorScheme == .dark ? .white : .gray)
                    }
                    
                    .padding(.vertical, 12)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    List {
                        ForEach(contacts, id: \.2) { contact in
                            ZStack {
                                NavigationLink(destination: ContactDetailView(contact: contact)) {
                                    EmptyView()
                                }
                                .opacity(0)
                                .buttonStyle(PlainButtonStyle())
                                
                                VStack {
                                    ContactRow(name: contact.0, status: contact.1, imageName: contact.2)
                                    Divider()
                                        .padding(.horizontal, 20)
                                }
                            }
                            
                            .listRowBackground(colorScheme == .dark ? Color.customColoreOne : Color.white)
                            .listRowSeparator(.hidden)
                        }
                    }
                    .background(colorScheme == .dark ? Color.customColoreOne : Color.white)
                    .listStyle(PlainListStyle())
                    
                    
                    
                    .listStyle(PlainListStyle())
                }
                .background(colorScheme == .dark ? Color.customColoreOne : Color.white)
                
                .tabItem {
                    Image("contacts")
                }
                
                Text("Second View")
                    .tabItem {
                        Image(colorScheme == .dark ? "messageDark" : "message")
                    }
                Text("Third View")
                    .tabItem {
                        Image(colorScheme == .dark ? "menuDark" : "menu")
                    }
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
