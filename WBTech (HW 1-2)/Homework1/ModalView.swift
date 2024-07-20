import SwiftUI

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            Button("Пообщались, давай обратно") {
                dismiss()
            }
            .font(.title)
            .foregroundColor(colorScheme == .dark ? .white : .black)
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(colorScheme == .dark ? Color.customColoreThree : Color.white)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
       
    }
}


