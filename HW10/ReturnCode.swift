import SwiftUI
struct ReturnCodeView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var smsCodes: [SMSCode] = [
        SMSCode(code: "1234", phoneNumber: "+7 999 999-99-99"),
        SMSCode(code: "5678", phoneNumber: "+7 999 888-88-88")
    ]
    @State private var currentCode = "1234"

    var body: some View {
        VStack(spacing: 10) {
            Spacer()

            Button(action: {
                let filteredCodes = smsCodes ~= currentCode
                if let matchedCode = filteredCodes.first {
                    print("Код запрошен повторно для номера \(matchedCode.phoneNumber)")
                } else {
                    print("Код не найден")
                }
            }) {
                Text("Запросить код повторно")
                    .font(.system(size: 16))
            }
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.bottom, 210)
        .multilineTextAlignment(.center)
        .foregroundColor(colorScheme == .dark ? .white : Color.customColoreTwo)
    }
}

