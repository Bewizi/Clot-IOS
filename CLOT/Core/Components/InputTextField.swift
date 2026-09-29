//
//  InputTextField.swift
//  CLOT
//
//  Created by Toluwalase on 23/09/2026.
//

import SwiftUI

struct InputTextField: View {
    
    let placeholder: String
    @Binding var text:String
    
    var body: some View {
            TextField(placeholder, text: $text)
                .padding(.horizontal, 12)
                .padding(.vertical, 19)
                .background(.whiteSmoke50)
                .clipShape(RoundedRectangle(cornerRadius: 4))
    }
}

#Preview {
    InputTextField(placeholder: "Email", text: .constant(""))
}
