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
    @State private var isPresentingNewScrumView = false
    @State private var newScrumData = DailyScrum.Data()
    
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
                isPresentingNewScrumView = true
            } label: {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NavigationView {
                DetailEditView(data: $newScrumData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction ) {
                            Button{
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            } label: {
                                Text("Dismiss")
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction ) {
                            Button {
                                let newScrum = DailyScrum(data: newScrumData)
                                scrums.append(newScrum)
                                isPresentingNewScrumView = false
                                newScrumData = DailyScrum.Data()
                            } label: {
                                Text("Add")
                            }
                        }
                    }
            }
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
