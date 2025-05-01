import Foundation

class MoodStore: ObservableObject {
    @Published var entries: [MoodEntry] = []
    private let saveKey = "MoodEntries"
    
    init() {
        loadEntries()
    }
    
    func addEntry(_ entry: MoodEntry) {
        entries.append(entry)
        saveEntries()
    }
    
    func deleteEntry(at indexSet: IndexSet) {
        entries.remove(atOffsets: indexSet)
        saveEntries()
    }
    
    func saveEntries() {
        if let encoded = try? JSONEncoder().encode(entries) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadEntries() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([MoodEntry].self, from: data) {
            entries = decoded
        }
    }
} 