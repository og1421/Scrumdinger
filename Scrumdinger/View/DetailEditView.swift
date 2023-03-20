//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 20/03/23.
//

import SwiftUI

struct DetailEditView: View {
    //MARK: - Properties
    @State private var data = DailyScrum.Data()
    @State private var newAttendeeName = ""
    
    
    //MARK: - Body
    var body: some View {
        Form {
            Section (header: Text("Meeting info")) {
                TextField("Title", text: $data.title)
                
                HStack {
                    Slider(value: $data.lengthInMinutes, in: 5...30, step: 1) {
                       Text("Length")
                    }//:SLIDER
                    .accessibilityValue("\(Int(data.lengthInMinutes)) minutes")
                    Spacer()
                    
                    Text("\(Int(data.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                }//:HSTACK
            }//:Section
            
            Section(header: Text("Attendees")) {
                ForEach(data.attendees) { attendee in
                    Text(attendee.name)
                }//:Loop
                .onDelete { indices in
                    data.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    TextField("New Attendee", text: $newAttendeeName)
                    Button {
                        withAnimation{
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            data.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }//:HSTACK
            }//:SECTION
        }//:FORM
    }
}

//MARK: - Preview
struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
