//
//  Swift_UI_day_2App.swift
//  Swift UI day 2
//
//  Created by Kerolos on 26/05/2025.
//

import SwiftUI
import SwiftData

@main
struct Swift_UI_day_2App: App {
    
    var sharedModelContainer: ModelContainer = {
          let schema = Schema([
              Landmark.self,
          ])
          let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
          
          do {
              return try ModelContainer(for: schema, configurations: [modelConfiguration])
          } catch {
              fatalError( "\(error)")
          }
      }()
    
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
