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
    
    //MARK: - Body
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
