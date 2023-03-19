//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 17/03/23.
//

import SwiftUI

struct ScrumsView: View {
    //MARK: - Properties
    let scrums: [DailyScrum]
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach(scrums) { scrum in
                NavigationLink(destination: Text(scrum.title)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
