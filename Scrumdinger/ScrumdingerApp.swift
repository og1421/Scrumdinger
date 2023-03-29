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
    @StateObject private var store = ScrumStore()
    @State private var errorWrapper: ErrorWrapper?

    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $store.scrums) {
                    Task {
                        do {
                            try await ScrumStore.save(scrums: store.scrums)
                        } catch {
                            errorWrapper = ErrorWrapper(error: error, guidance: "Try again later.")
                        }
                    }
                }
            }
            .task {
                do {
                    store.scrums = try await ScrumStore.load()
                } catch {
                    errorWrapper = ErrorWrapper(error: error, guidance: "Scrumdinger will load sample data and continue.")
                }
            }
            .sheet(item: $errorWrapper, onDismiss: {
                store.scrums = DailyScrum.sampleData
            }) { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
