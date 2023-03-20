//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 19/03/23.
//

import SwiftUI

struct DetailView: View {
    //MARK: - Properties
    let scrum: DailyScrum
    
    //MARK: - Body
    var body: some View {
        List {
            Section(header: Text("Meeting info")){
                NavigationLink(destination: MettingView()) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                    .foregroundColor(.accentColor)
                }
                
                HStack {
                    Label("Length", systemImage: "clock")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }//: HSTACK
                .accessibilityElement(children: .combine)
                
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    
                    Spacer()
                    
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }//:HSTACK
                .accessibilityElement(children: .combine)
            }//:SECTION
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label(attendee.name, systemImage: "person")
                }
            }//:SECTION
        }//:LIST
        .navigationTitle(scrum.title)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: DailyScrum.sampleData[0])
        }
    }
}
