# MoodTracker

A modern iOS app for tracking your daily mood and managing stress levels.

## Features

- **Mood Tracking**
  - Record your daily mood with emoji-based selection
  - Add optional notes to your mood entries
  - View mood history in a clean, organized list
  - Edit or delete previous mood entries

- **Stress Relief**
  - Interactive emoji button for stress relief
  - Fun animations and sound effects
  - Tap counter to track your stress relief sessions
  - Multiple emoji options that change with each tap

## Technical Details

- Built with SwiftUI
- iOS 17+ compatible
- Uses UserDefaults for data persistence
- Modern, clean UI design
- Supports both light and dark mode

## Project Structure

```
MoodTracker/
├── ContentView.swift          # Main view with mood list and navigation
├── AddMoodView.swift          # View for adding new mood entries
├── EditMoodView.swift         # View for editing existing entries
├── MoodEntryRow.swift         # Custom row view for mood entries
├── MoodEntry.swift            # Data model for mood entries
├── MoodStore.swift            # Data management and persistence
├── StressReliefView.swift     # Interactive stress relief feature
├── Assets.xcassets/           # App assets and images
└── pop.wav                    # Sound effect for stress relief
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/emhw0930/MoodTracker.git
```

2. Open the project in Xcode:
```bash
cd MoodTracker
open MoodTracker.xcodeproj
```

3. Build and run the project in Xcode

## Usage

1. **Tracking Your Mood**
   - Tap the + button to add a new mood entry
   - Select your current mood from the emoji picker
   - Add an optional note
   - Save your entry

2. **Managing Entries**
   - Swipe left on any entry to delete it
   - Tap an entry to edit it
   - View your mood history in chronological order

3. **Stress Relief**
   - Tap the heart icon in the bottom toolbar
   - Press the emoji button to start stress relief
   - Watch the animations and listen to the sound effects
   - Track your taps with the counter

## Contributing

Feel free to submit issues and enhancement requests!

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- SwiftUI for the modern UI framework
- Apple for providing the development tools
- The open-source community for inspiration and support 