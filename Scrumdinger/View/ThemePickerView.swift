//
//  ThemePickerView.swift
//  Scrumdinger
//
//  Created by Orlando Moraes Martins on 21/03/23.
//

import SwiftUI

struct ThemePickerView: View {
    //MARK: - Properties
    @Binding var selection: Theme
    
    //MARK: - Body
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
    }
}

struct ThemePickerView_Previews: PreviewProvider {
    static var previews: some View {
        ThemePickerView(selection: .constant(.periwinkle))
    }
}
