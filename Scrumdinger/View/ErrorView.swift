//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 29/03/23.
//

import SwiftUI

struct ErrorView: View {
    //MARK: - Properties
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    //MARK: - Body
    var body: some View {
        NavigationView {
           VStack {
               Text("An error has occurred!")
                   .font(.title)
                   .padding(.bottom)
               Text(errorWrapper.error.localizedDescription)
                   .font(.headline)
               Text(errorWrapper.guidance)
                   .font(.caption)
                   .padding(.top)
               Spacer()
           }
           .padding()
           .background(.ultraThinMaterial)
           .cornerRadius(16)
           .navigationBarTitleDisplayMode(.inline)
           .toolbar {
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button ("Dismiss") {
                       dismiss()
                   }
               }// Item 1
               
               
           }
       }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error.")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
