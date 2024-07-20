import WidgetKit
import SwiftUI
import AppIntents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: sampleContacts)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), contacts: sampleContacts)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, contacts: sampleContacts)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

let sampleContacts = [
    ("Анастасия Иванова", "Last seen yesterday", "people1"),
    ("Петя Петров", "Online", "people2"),
    ("Маман Иванова", "Last seen 3 hours ago", "people3"),
    ("Арбуз Дыня", "Online", "people4"),
    ("Иван Иванов", "Online", "people5"),
    ("Лиса Алиса", "Last seen 30 minutes ago", "people6")
]

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: [(String, String, String)]
}
struct ContactView: View {
    var contact: (String, String, String)
    
    var body: some View {
        VStack {
            if contact.0 == "Иван Иванов" {
                ZStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 73, height: 73)
                    Text("И")
                        .foregroundColor(.white)
                        .font(.title)
                }
            } else if contact.0 == "Лиса Алиса" {
                ZStack {
                    Circle()
                        .fill(Color.purple)
                        .frame(width: 73, height: 73)
                    Text("Л")
                        .foregroundColor(.white)
                        .font(.title)
                }
            } else {
                Image(contact.2)
                    .resizable()
                    .frame(width: 73, height: 73)
                    .clipShape(Circle())
            }
            Text(firstWord(of: contact.0))
                .font(.caption)
        }
    }
    
    func firstWord(of name: String) -> String {
        return name.split(separator: " ").map(String.init).first ?? ""
    }
}



struct hw3EntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            smallWidgetView
        case .systemMedium:
            mediumWidgetView
        case .systemLarge:
            largeWidgetView
        default:
            smallWidgetView
        }
    }

    var smallWidgetView: some View {
        VStack {
            if let contact = entry.contacts.first {
                ContactView(contact: contact)
            }
        }
    }

    var mediumWidgetView: some View {
        HStack {
            ForEach(entry.contacts.prefix(4), id: \.2) { contact in
                ContactView(contact: contact)
            }
        }
    }

    var largeWidgetView: some View {
        VStack {
            HStack {
                ForEach(entry.contacts.prefix(3), id: \.2) { contact in
                    ContactView(contact: contact)
                }
            }
            HStack {
                ForEach(entry.contacts.dropFirst(3).prefix(3), id: \.2) { contact in
                    ContactView(contact: contact)
                }
            }
        }
    }
}

struct hw3: Widget {
    let kind: String = "hw3"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            hw3EntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("My Contacts Widget")
        .description("Displays a list of contacts.")
    }
}

#Preview(as: .systemSmall) {
    hw3()
} timeline: {
    SimpleEntry(date: .now, contacts: sampleContacts)
    SimpleEntry(date: .now, contacts: sampleContacts)
}

#Preview(as: .systemMedium) {
    hw3()
} timeline: {
    SimpleEntry(date: .now, contacts: sampleContacts)
    SimpleEntry(date: .now, contacts: sampleContacts)
}

#Preview(as: .systemLarge) {
    hw3()
} timeline: {
    SimpleEntry(date: .now, contacts: sampleContacts)
    SimpleEntry(date: .now, contacts: sampleContacts)
}


