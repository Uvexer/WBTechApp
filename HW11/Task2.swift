//Придумайте и реализуйте собственную простую хеш-функцию для строк.

//Зашифровал строку, перемешивая и изменяя её символы.
import Foundation

func task2(){
    
    func complexStringManipulation(input: String) -> String {
        //посчитал хеш длины строки чтобы найти сдвиг
        let lengthHash = input.count.hashValue % 26
        
        // Перестановка символов
        let shuffled = String(input.shuffled())
        
        // Измененил символы
        var modifiedString = ""
        for (index, char) in shuffled.enumerated() {
            if let ascii = char.asciiValue {
                // Выбирал простое число для каждого символа на основе его позиции
                let prime = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41][index % 13]
                
                // Вычислил новый символ
                var newChar = UInt8((Int(ascii) + lengthHash + prime) % 128)
                
                // Проверил, что символ печатный
                if newChar < 32 { newChar += 32 }
                if newChar > 126 { newChar -= 95 } // Сдвинул в пределы
                
                modifiedString.append(Character(UnicodeScalar(newChar)))
            }
        }
        return modifiedString
    }
    
    let stringTaskTwo = "Task2"
    let result = complexStringManipulation(input: stringTaskTwo)
    print("Modified string: \(result)")
}
