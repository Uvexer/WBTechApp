import SwiftUI

struct AgreementTextView: View {
    var body: some View {
        HStack {
            Text("Нажимая кнопку продолжить я соглашаюсь с ")
                .font(.system(size: 9))
                .foregroundColor(Color.gray)
            + Text("\nПолитикой Конфиденциальности")
                .font(.system(size: 9))
                .foregroundColor(Color.customColoreTwo)
            + Text(" и ")
                .font(.system(size: 9))
                .foregroundColor(Color.gray)
            + Text("Условиями Использования")
                .font(.system(size: 9))
                .foregroundColor(Color.customColoreTwo)
        }
        .multilineTextAlignment(.center)
        .frame(width: 327, height: 32)
    }
}

struct AgreementTextView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementTextView()
    }
}


