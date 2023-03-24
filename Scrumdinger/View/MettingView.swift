//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 14/03/23.
//

import SwiftUI

struct MettingView: View {
    //MARK: - Properties
    @Binding var scrum: DailyScrum
    @StateObject var scrumTimer = ScrumTimer()
    
    //MARK: - Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
            VStack {
                MeetingHeaderVIew(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scum.theme)
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                HStack {
                    Text("Speaker 1 of 3")
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }//:HSTACK
            }//:Vstack
            .padding()
        }//:ZSTACK
        .foregroundColor(scrum.theme.accentColor)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct MettingView_Previews: PreviewProvider {
    static var previews: some View {
        MettingView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
