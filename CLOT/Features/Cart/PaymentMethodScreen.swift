import SwiftUI
import Combine
struct PaymentMethodScreen: View {
    @Environment(\.dismiss) private var dismiss
    let onSaved: () -> Void

    @State private var cardholderName = ""
    @State private var cardNumber = ""
    @State private var expiryDate = ""
    @State private var securityCode = ""
    @State private var showError = false

    private var canSave: Bool {
        !cardholderName.trimmingCharacters(in: .whitespaces).isEmpty &&
        cardNumber.filter(\.isNumber).count >= 12 &&
        expiryDate.count >= 4 && securityCode.filter(\.isNumber).count >= 3
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                AppText(title: "Payment Method", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                HStack { BackButton(); Spacer() }
            }

            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    AppText(title: "Add Payment Method", fontSize: 24, textColor: .shadowGrey900, fontWeight: .semibold)
                    InputTextField(placeholder: "Cardholder Name", text: $cardholderName)
                    InputTextField(placeholder: "Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                    HStack(spacing: 12) {
                        InputTextField(placeholder: "MM/YY", text: $expiryDate)
                            .keyboardType(.numberPad)
                        InputTextField(placeholder: "CVV", text: $securityCode)
                            .keyboardType(.numberPad)
                    }
                    if showError {
                        AppText(title: "Enter valid card details to continue.", fontSize: 14, textColor: .red, fontWeight: .regular)
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
    PaymentMethodScreen(onSaved: {})
}
