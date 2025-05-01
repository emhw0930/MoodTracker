import Foundation

struct MoodEntry: Identifiable, Codable {
    let id: UUID
    let mood: Mood
    let date: Date
    let note: String
    
    init(id: UUID = UUID(), mood: Mood, date: Date = Date(), note: String = "") {
        self.id = id
        self.mood = mood
        self.date = date
        self.note = note
    }
}

enum Mood: String, CaseIterable, Codable {
    case veryHappy = "😄"
    case happy = "😊"
    case neutral = "😐"
    case sad = "😔"
    case verySad = "😢"
    
    var description: String {
        switch self {
        case .veryHappy: return "Very Happy"
        case .happy: return "Happy"
        case .neutral: return "Neutral"
        case .sad: return "Sad"
        case .verySad: return "Very Sad"
        }
    }
} 