import SwiftUI

struct AddMoodView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var moodStore: MoodStore
    
    @State private var selectedMood: Mood = .neutral
    @State private var note: String = ""
    
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
            .navigationTitle("Add Mood")
            .navigationBarItems(
                leading: Button("Cancel") { dismiss() },
                trailing: Button("Save") {
                    let entry = MoodEntry(mood: selectedMood, note: note)
                    moodStore.addEntry(entry)
                    dismiss()
                }
            )
        }
    }
}

#Preview {
    AddMoodView(moodStore: MoodStore())
} 
