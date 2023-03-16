//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 14/03/23.
//

import SwiftUI

struct MettingView: View {
    var body: some View {
        VStack {
            ProgressView(value: 5, total: 15)
            HStack {
                VStack(alignment: .leading) {
                    Text("Seconds Enlapsed")
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }//:Vstack

                Spacer()

                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }//:Vstack
            }//:HStack
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Time remaining")
            .accessibilityLabel("10 minutes")
            
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
    }
}

struct MettingView_Previews: PreviewProvider {
    static var previews: some View {
        MettingView()
    }
}
