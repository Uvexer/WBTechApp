import SwiftUI

struct CustomTextFieldView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var phoneNumber: String = ""
    @FocusState private var isTextFieldFocused: Bool

    var body: some View {
        ZStack(alignment: .leading) {
            Color.clear
                .contentShape(Rectangle())
                .onTapGesture {
                    isTextFieldFocused = false
                }

            Text("000 000-00-00")
                .foregroundColor(.customColoreFive)
                .opacity(phoneNumber.isEmpty ? 1 : 0)
                .animation(.easeInOut(duration: 0.3), value: phoneNumber.isEmpty)  

            TextField("", text: $phoneNumber)
                .keyboardType(.numberPad)
                .foregroundColor(colorScheme == .dark ? .white : Color.black)
                .focused($isTextFieldFocused)
        }
        .padding(.leading)
        .frame(height: 40)
        .background(colorScheme == .dark ? .customColoreSix : Color.customColoreFour)
        .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView()
    }
}


extension View{
    func dismissKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}

