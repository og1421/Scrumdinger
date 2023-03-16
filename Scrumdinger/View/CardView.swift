//
//  CardView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 16/03/23.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    var body: some View {
        VStack (alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                
                Label("\(scrum.lenghtInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lenghtInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
                
            }//:HSTACK
            .font(.caption)
        }//: VSTACK
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

struct CardView_Previews: PreviewProvider {
    static var scrum  = DailyScrum.sampleData[0]
    static var previews: some View {
        CardView(scrum: scrum)
            .background(scrum.theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
