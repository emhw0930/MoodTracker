//
//  ContentView.swift
//  MoodTracker
//
//  Created by Ethan Wu on 2025/4/16.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var moodStore = MoodStore()
    @State private var showingAddMood = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(moodStore.entries.sorted(by: { $0.date > $1.date })) { entry in
                    MoodEntryRow(entry: entry, moodStore: moodStore)
                }
                .onDelete(perform: moodStore.deleteEntry)
            }
            .background(Color(red: 0.95, green: 0.95, blue: 0.95))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("mood-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 150)
                        .padding(.vertical, 25)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddMood = true }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    NavigationLink(destination: StressReliefView()) {
                        HStack {
                            Image(systemName: "heart.fill")
                                .font(.title2)
                            Text("Stress Relief")
                                .font(.headline)
                        }
                        .foregroundColor(.pink)
                        .padding(.vertical, 8)
                    }
                }
            }
            .sheet(isPresented: $showingAddMood) {
                AddMoodView(moodStore: moodStore)
            }
        }
    }
}

#Preview {
    ContentView()
}
