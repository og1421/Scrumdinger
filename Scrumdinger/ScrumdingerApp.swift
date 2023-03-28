//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 14/03/23.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    //MARK: - Properties
    @State private var scrums = DailyScrum.sampleData
    @StateObject private var store = ScrumStore()
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            fatalError("Error saving scrums.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    fatalError("Error loading scrums.")
                }
            }
        }
    }
}
