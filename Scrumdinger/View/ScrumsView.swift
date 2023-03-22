//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 17/03/23.
//

import SwiftUI

struct ScrumsView: View {
    //MARK: - Properties
    @Binding var scrums: [DailyScrum]
    
    //MARK: - Body
    var body: some View {
        List {
            ForEach($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }//: LOOP
        }//: LIST
        .navigationTitle("Daily Scrum")
        .toolbar {
            Button{
                
            } label: {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
    }
}
