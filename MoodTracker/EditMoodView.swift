import SwiftUI

struct EditMoodView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var moodStore: MoodStore
    let entry: MoodEntry
    
    @State private var selectedMood: Mood
    @State private var note: String
    
    init(moodStore: MoodStore, entry: MoodEntry) {
        self.moodStore = moodStore
        self.entry = entry
        _selectedMood = State(initialValue: entry.mood)
        _note = State(initialValue: entry.note)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("How are you feeling?")) {
                    Picker("Mood", selection: $selectedMood) {
                        ForEach(Mood.allCases, id: \.self) { mood in
                            Text("\(mood.rawValue) \(mood.description)")
                                .tag(mood)
                        }
                    }
                    .pickerStyle(.wheel)
                }
                
                Section(header: Text("Note (optional)")) {
                    TextEditor(text: $note)
                        .frame(height: 100)
                }
            }
            .navigationTitle("Edit Mood")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    let updatedEntry = MoodEntry(
                        id: entry.id,
                        mood: selectedMood,
                        date: entry.date,
                        note: note
                    )
                    if let index = moodStore.entries.firstIndex(where: { $0.id == entry.id }) {
                        moodStore.entries[index] = updatedEntry
                        moodStore.saveEntries()
                    }
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    EditMoodView(
        moodStore: MoodStore(),
        entry: MoodEntry(mood: .happy, note: "Sample note")
    )
} 