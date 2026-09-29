//
//  GenderSelectionButton.swift
//  CLOT
//
//  Created by Toluwalase on 24/09/2026.
//

import SwiftUI

struct GenderSelectionButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            AppText(
                title: title,
                fontSize: 16,
                textColor: isSelected ? .white : .shadowGrey900,
                fontWeight: isSelected ? .medium : .regular
            )
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(
                Capsule()
                    .fill(isSelected ? Color.mediumSlateBlue300 : Color(.systemGray5))
            )
        }
    }
}

#Preview {
    GenderSelectionButton(
        title: "Men", isSelected: true, action: {}
    )
}
