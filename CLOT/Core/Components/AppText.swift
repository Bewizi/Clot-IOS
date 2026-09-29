//
//  AppText.swift
//  CLOT
//
//  Created by Toluwalase on 23/09/2026.
//

import SwiftUI


struct AppText: View {
    let title: String
    let fontSize: CGFloat
    let textColor: Color
    let fontWeight: Font.Weight?
    var body: some View {
        Text(title)
            .foregroundStyle(textColor)
            .font(.system(size: fontSize, weight: fontWeight))
            .multilineTextAlignment(.center)
    }
}

#Preview {
    AppText(title: "Hello World", fontSize: 24, textColor: .red, fontWeight: .regular)
}
