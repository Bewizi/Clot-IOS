//
//  AddressMethodScreen.swift
//  CLOT
//
//  Created by Toluwalase on 20/10/2026.
//

import SwiftUI

struct AddressMethodScreen: View {
    @Environment(\.dismiss) private var dismiss
    let onSaved: () -> Void

    @State private var streetAddress = ""
    @State private var city = ""
    @State private var state = ""
    @State private var zipCode = ""
    @State private var showError = false

    private var canSave: Bool {
        !streetAddress.trimmingCharacters(in: .whitespaces).isEmpty &&
        city.filter(\.isNumber).count >= 12 &&
        state.count >= 4 && zipCode.filter(\.isNumber).count >= 3
    }
    var body: some View {
        VStack{
            ZStack {
                AppText(title: "Add Address", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                HStack { BackButton(); Spacer() }
            }
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    InputTextField(placeholder: "Street Address", text: $streetAddress)
                    InputTextField(placeholder: "City", text: $city)
                        .keyboardType(.numberPad)
                    HStack(spacing: 12) {
                        InputTextField(placeholder: "State", text: $state)
                            .keyboardType(.numberPad)
                        InputTextField(placeholder: "Zip Code", text: $zipCode)
                            .keyboardType(.numberPad)
                    }
                    if showError {
                        AppText(title: "Enter valid information details to continue.", fontSize: 14, textColor: .red, fontWeight: .regular)
                    }
                }
                .padding(.top, 32)
            }
        }
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity)
        .background(.midnightViolet900)
        .safeAreaInset(edge: .bottom) {
            Button {
                guard canSave else { showError = true; return }
                onSaved()
                dismiss()
            } label: {
                AppText(title: "Save", fontSize: 16, textColor: .white, fontWeight: .medium)
                    .frame(maxWidth: .infinity)
                    .frame(height: 64)
                    .background(.mediumSlateBlue300)
                    .clipShape(Capsule())
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
        }
    }
}

#Preview {
    AddressMethodScreen(onSaved: {})
}
