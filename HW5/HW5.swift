import SwiftUI
import Combine

class Passport: ObservableObject {
    @Published var series: String
    @Published var number: String
    @Published var issueDate: Date
    weak var owner: Person?

    init(series: String = "", number: String = "", issueDate: Date = Date(), owner: Person? = nil) {
        self.series = series
        self.number = number
        self.issueDate = issueDate
        self.owner = owner
        print("Инициализирован Паспорт: серия \(series), номер \(number)")
    }

    deinit {
        print("Паспорт освобожден из памяти")
    }
}

class Person: ObservableObject {
    @Published var fullName: String
    @Published var age: Int
    @Published var passport: Passport?

    init(fullName: String = "", age: Int = 0, passport: Passport? = nil) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        self.passport?.owner = self
        print("Инициализирован Человек: \(fullName), возраст \(age)")
    }

    deinit {
        print("\(fullName) освобожден из памяти")
    }
}

struct ContentView5: View {
    @StateObject var person = Person(fullName: "Иван Иванов", age: 34, passport: Passport(series: "1234", number: "567890"))

    var body: some View {
        VStack {
            Text("Человек: \(person.fullName), Возраст: \(person.age)")
            Text("Паспорт: Серия \(person.passport?.series ?? ""), Номер \(person.passport?.number ?? "")")
            Button("Обновить данные") {
                updateData()
            }
        }
    }
    
    func updateData() {
        person.fullName = "Петр Петров"
        person.age = 45
        person.passport = Passport(series: "ABCD", number: "1234567")
        print("Данные обновлены: \(person.fullName), \(person.age), Паспорт: серия \(person.passport?.series ?? ""), номер \(person.passport?.number ?? "")")
    }
}


struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}

