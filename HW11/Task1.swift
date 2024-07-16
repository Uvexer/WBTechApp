//1. Напишите функцию на Swift,
//которая принимает строку и
//возвращает её хеш, используя
//встроенную функцию hash().

import Foundation
// Функция хеширования
func task1(){
    
    func hashOfString(_ input: String) -> Int {
        return input.hashValue
    }
    let stringTaskOne = "Task1"
    let hash = hashOfString(stringTaskOne)
    print("Hash of '\(stringTaskOne)' is \(hash)")
    
}
