import SwiftUI
struct TextAddCodeView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
        VStack(spacing:10) {
            Spacer()
            
            Text("Введите Код")
                .font(.system(size: 24).bold())
            Text("Отправили код на номер \n+7 999 999-99-99")
                .font(.system(size: 12))
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
        }
        .padding(.bottom,100)
        .multilineTextAlignment(.center)
        .foregroundColor(colorScheme == .dark ? .white : Color.customColoreOne)
        
        
    }
}

struct TextAddCodeView_Previews : PreviewProvider{
    static var previews: some View {
        TextAddCodeView()
    }
}

