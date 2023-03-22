//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 21/03/23.
//

import SwiftUI

struct ThemeView: View {
    //MARK: - Properties
    let theme: Theme
    
    //MARK: - Body
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(theme.mainColor)
            Label(theme.name, systemImage: "paintpalette")
                .padding(4)
        }//:ZSTACK
        .foregroundColor(theme.accentColor)
        .fixedSize(horizontal: false, vertical: true)    }
}

struct ThemeView_Previews: PreviewProvider {
    static var previews: some View {
        ThemeView(theme: .buttercup)
    }
}
