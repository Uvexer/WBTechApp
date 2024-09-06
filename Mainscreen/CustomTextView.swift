import SwiftUI

struct CustomTextView: View {
    var text: String
    var colorScheme: ColorScheme
    
    var body: some View {
        Text(text)
            .font(.system(size: 23, weight: .heavy))
            .foregroundColor(colorScheme == .dark ? .white : Color.customColoreOne)
            .multilineTextAlignment(.center)
            .frame(width: 280, height: 58)
            .padding(.horizontal)
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextView(text: "Общайтесь с друзьями и близкими легко", colorScheme: .light)
    }
}

