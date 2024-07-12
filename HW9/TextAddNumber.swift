import SwiftUI
struct TextAddNumberView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        VStack(spacing:10) {
            Spacer()
            
            Text("Введите номер телефона")
                .font(.system(size: 24).bold())
            Text("Мы вышлем код подтверждения \nна указанный номер")
                .font(.system(size: 12))
            
        }
        .padding(.bottom,100)
        .multilineTextAlignment(.center)
        .foregroundColor(colorScheme == .dark ? .white : Color.customColoreOne)
   
    }
}

struct TextAddNumberView_Previews : PreviewProvider{
    static var previews: some View {
        TextAddNumberView()
    }
}

