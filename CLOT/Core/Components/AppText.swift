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
    let textAlignment: TextAlignment?

    init(
        title: String,
        fontSize: CGFloat = 16,
        textColor: Color = .primary,
        fontWeight: Font.Weight? = nil,
        textAlignment: TextAlignment? = nil
    ) {
        self.title = title
        self.fontSize = fontSize
        self.textColor = textColor
        self.fontWeight = fontWeight
        self.textAlignment = textAlignment
    }

    var body: some View {
        Text(title)
            .foregroundStyle(textColor)
            .font(.system(size: fontSize, weight: fontWeight))
//            .modifier(OptionalMultilineAlignment(textAlignment))
            .multilineTextAlignment(textAlignment ?? .center)
    }
}

//private struct OptionalMultilineAlignment: ViewModifier {
//    let alignment: TextAlignment?
//    init(_ alignment: TextAlignment?) { self.alignment = alignment }
//    func body(content: Content) -> some View {
//        if let alignment {
//            content.multilineTextAlignment(alignment)
//        } else {
//            content
//        }
//    }
//}

#Preview {
    VStack(alignment: .leading, spacing: 16) {
        AppText(title: "Hello World default")
        AppText(title: "Hello World centered", fontSize: 24, textColor: .red, fontWeight: .regular, textAlignment: .center)
    }
    .padding()
}
