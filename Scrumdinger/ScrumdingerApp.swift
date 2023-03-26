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
                    ScrumStore.save(scrums: store.scrums) { result in
                        if case .failure(let error) = result {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
            }
            .onAppear{
                ScrumStore.load { result in
                    switch result {
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    case.success(let scrums):
                        store.scrums = scrums
                    }
                }
            }//: onAppear
        }
    }
}
