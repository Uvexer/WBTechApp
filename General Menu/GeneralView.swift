import SwiftUI


struct HomeworkItem: Identifiable {
    var id: Int
}

struct GeneralView: View {
    @State private var selectedHomework: HomeworkItem?

    var body: some View {
        NavigationView {
            List {
                Button("ДЗ 1 - Гайдлайны HIG") {
                    self.selectedHomework = HomeworkItem(id: 1)
                }
                Button("ДЗ 2 - Навигация и роутинг") {
                    self.selectedHomework = HomeworkItem(id: 2)
                }
                Button("ДЗ 3 - Экстеншены приложения") {
                    self.selectedHomework = HomeworkItem(id: 3)
                }
                Button("ДЗ 4 - Особая система типов") {
                    self.selectedHomework = HomeworkItem(id: 4)
                }
                Button("ДЗ 5 - Замыкания") {
                    self.selectedHomework = HomeworkItem(id: 5)
                }
                Button("ДЗ 6 - Строки в Swift") {
                    self.selectedHomework = HomeworkItem(id: 6)
                }
                Button("ДЗ 8 - Инфинити скролл") {
                    self.selectedHomework = HomeworkItem(id: 7)
                }
                
            }
            .navigationTitle("Меню домашек")
            .sheet(item: $selectedHomework) { item in
                switch item.id {
                case 1:
                    ContentView()
                case 2:
                    ContentView2()
                case 3:
                    ContentView3()
                case 4:
                    ContentView4()
                case 5:
                    ContentView5()
                case 6:
                    ContentView6()
                case 7:
                    ContentView8()
                default:
                    Text("Неизвестное ДЗ") 
                }
            }
        }
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}

