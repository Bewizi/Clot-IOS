//
//  BackBtn.swift
//  CLOT
//
//  Created by Toluwalase on 07/10/2026.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button{
            dismiss()
        }label: {
            Image("arrowleft2")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(.shadowGrey900)
                .scaledToFit()
                .frame(width: 24)
                .padding()
                .background(.whiteSmoke50)
                .clipShape(Circle())
                
        }
    }
}

#Preview {
    BackButton()
}
