import SwiftUI

struct MoodEntryRow: View {
    let entry: MoodEntry
    @ObservedObject var moodStore: MoodStore
    @State private var showingEditMood = false
    
    var body: some View {
        HStack {
            Text(entry.mood.rawValue)
                .font(.title)
            VStack(alignment: .leading) {
                Text(entry.mood.description)
                    .font(.headline)
                if !entry.note.isEmpty {
                    Text(entry.note)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
            Spacer()
            Text(entry.date, style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
            
            Button(action: { showingEditMood = true }) {
                Image(systemName: "pencil.circle.fill")
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 4)
        .sheet(isPresented: $showingEditMood) {
            EditMoodView(moodStore: moodStore, entry: entry)
        }
    }
}

#Preview {
    MoodEntryRow(entry: MoodEntry(mood: .happy, note: "Sample note"), moodStore: MoodStore())
} 