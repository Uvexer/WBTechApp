//3. Set:
//Создайте множество (set) из целых чисел.
//Добавьте несколько элементов в это множество.
//Удалите один элемент.
//Проверьте, существует ли определенный элемент в множестве.
//Примените операции объединения, пересечения и разности на множествах
import Foundation

func task3() {
    // Создал множества
    var s: Set<Int> = [1, 2, 3]

    // Добавил
    s.insert(4)
    s.insert(5)

    // Удалил
    s.remove(2)

    // Проверил наличие элемента
    let containsElement = s.contains(3) // true, если он есть

    // Создал другое множество
    let otherSet: Set<Int> = [3, 4, 5, 6, 7]

    // Объединение
    let union = s.union(otherSet)

    //Пересечение
    let intersection = s.intersection(otherSet)

    //Разность
    let difference = s.subtracting(otherSet)

    // Вывод результатов
    print("Исходное множество: \(s)")
    print("Содержит 3: \(containsElement)")
    print("Объединение: \(union)")
    print("Пересечение: \(intersection)")
    print("Разность: \(difference)")
}


