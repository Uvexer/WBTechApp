import SwiftUI

class CodeInputModel: ObservableObject {
    @Published var code = "" 
}

struct CodeInputView: View {
    @StateObject private var inputModel = CodeInputModel()
    @FocusState private var isKeyboardActive: Bool
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(0..<4, id: \.self) { index in
                    ZStack {
                        if index >= inputModel.code.count {
                            Circle()
                                .fill(Color.customColoreSeven)
                                .frame(width: 24, height: 24)
                        }
                        Text(getDigit(at: index))
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.customColoreOne)
                    }
                }
            }
            .padding()
            .onTapGesture {
                isKeyboardActive = true
            }
            
            TextField("", text: $inputModel.code)
                .keyboardType(.numberPad)
                .focused($isKeyboardActive)
                .frame(width: 0, height: 0)
                .onChange(of: inputModel.code) { newValue in
                    inputModel.code = String(newValue.prefix(4))
                }
        }
        .padding()
    }
    
    private func getDigit(at index: Int) -> String {
        guard index < inputModel.code.count else { return "" }
        let codeArray = Array(inputModel.code)
        return String(codeArray[index])
    }
}
