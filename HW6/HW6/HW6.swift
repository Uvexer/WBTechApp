import SwiftUI

extension String.StringInterpolation {
    mutating func appendInterpolation(date: Date, style: DateFormatter.Style, locale: Locale) {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = .none
        formatter.locale = locale
        appendLiteral(formatter.string(from: date))
    }

    mutating func appendInterpolation(spelledOut date: Date, locale: Locale) {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = locale
        formatter.doesRelativeDateFormatting = true
        appendLiteral(formatter.string(from: date))
    }
}

struct ContentView6: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedDate = Date()
    @State private var selectedLocaleIndex = 0
    private let locales = [
        ("🇺🇸", Locale(identifier: "en_US")),
        ("🇩🇪", Locale(identifier: "de_DE")),
        ("🇷🇺", Locale(identifier: "ru_RU")),
        ("🇫🇷", Locale(identifier: "fr_FR")),
        ("🇪🇸", Locale(identifier: "es_ES"))
    ]
    
    var body: some View {
        VStack {
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Picker("Select a locale", selection: $selectedLocaleIndex) {
                ForEach(0..<locales.count) { index in
                    Text(locales[index].0).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ForEach(-2...2, id: \.self) { offset in
                Text("\(date: self.selectedDate.addingTimeInterval(Double(86400 * offset)), style: .full, locale: self.locales[selectedLocaleIndex].1)")
                    .padding(.vertical, 2)
            }
            
            Spacer()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Вернуться на главный экран")
                    .foregroundColor(.white)
                    .padding()
                    .background(Capsule().fill(Color.blue))
            }
        }
        .padding()
        .navigationBarBackButtonHidden(false)
        .navigationBarHidden(true)
        .gesture(DragGesture().onEnded { value in
            let swipeLeft = value.translation.width < -50
            let swipeRight = value.translation.width > 50
            if swipeLeft || swipeRight {
                self.presentationMode.wrappedValue.dismiss()
            }
        })
    }
    
}

struct ContentView6_Previews: PreviewProvider {
    static var previews: some View {
        ContentView6()
    }
}

