//
//  CheckoutScreen.swift
//  CLOT
//
//  Created by Toluwalase on 15/10/2026.
//

import SwiftUI

struct CheckoutScreen: View {
    @EnvironmentObject private var cart: CartStore
    @State private var hasPaymentMethod = false

    private var shippingCost: Double { cart.items.isEmpty ? 0 : 8 }
    private var total: Double { cart.subtotal + shippingCost }

    var body: some View {
        VStack(spacing: 0) {
            ZStack{
                AppText(title: "Checkout", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                
                HStack{
                    BackButton()
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity)

            ScrollView(showsIndicators: false) {
                VStack(spacing: 16) {
                    CheckoutRow(title: "Shipping Address", value: "Add Shipping Address") {
                        // Address entry can be connected here when that flow is added.
                    }

                    NavigationLink {
                        PaymentMethodScreen(onSaved: { hasPaymentMethod = true })
                            .navigationBarBackButtonHidden()
                    } label: {
                        CheckoutRowContent(
                            title: "Payment Method",
                            value: hasPaymentMethod ? "Card ending in ••••" : "Add Payment Method"
                        )
                    }
                    .buttonStyle(.plain)

                    Spacer(minLength: 300)

                    VStack(alignment: .leading, spacing: 12) {
                        SummaryRow(title: "Subtotal", value: currency(cart.subtotal), emphasized: false)
                        SummaryRow(title: "Shipping Cost", value: currency(shippingCost), emphasized: false)
                        SummaryRow(title: "Tax", value: currency(0), emphasized: false)
                        SummaryRow(title: "Total", value: currency(total), emphasized: true)
                    }
                }
                .padding(.top, 32)
                .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 24)
        .frame(maxHeight: .infinity)
        .background(.midnightViolet900)
        .safeAreaInset(edge: .bottom, spacing: 0) {
            Button {
               
            } label: {
                HStack {
                    AppText(
                        title: currency(total),
                        fontSize: 16,
                        textColor: .white,
                        fontWeight: .bold
                    )

                    Spacer()

                    AppText(
                        title: "Place Order",
                        fontSize: 16,
                        textColor: .white,
                        fontWeight: .medium
                    )
                }
                .padding(.horizontal, 24)
                
                .frame(maxWidth: .infinity)
                .frame(height: 64)
                .background(.mediumSlateBlue300)
                .clipShape(Capsule())
            }
            .padding(.horizontal, 24)
            .padding(.top, 12)
        }
    }

    private func currency(_ amount: Double) -> String {
        String(format: "$%.2f", amount).replacingOccurrences(of: ".00", with: "")
    }
}

private struct CheckoutRow: View {
    let title: String
    let value: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            CheckoutRowContent(title: title, value: value)
        }
        .buttonStyle(.plain)
    }
}

private struct CheckoutRowContent: View {
    let title: String
    let value: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 16) {
                AppText(title: title, fontSize: 16, textColor: .shadowGrey900.opacity(0.5), fontWeight: .semibold)
                AppText(title: value, fontSize: 20, textColor: .shadowGrey900, fontWeight: .regular)
            }
            Spacer()
            Image( "arrowright2")
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundStyle(.shadowGrey900)
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity, minHeight: 128, alignment: .leading)
        .background(.whiteSmoke50)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

private struct SummaryRow: View {
    let title: String
    let value: String
    let emphasized: Bool

    var body: some View {
        HStack {
            AppText(title: title, fontSize: 16, textColor: .shadowGrey900.opacity(0.5), fontWeight: .semibold)
            Spacer()
            AppText(title: value, fontSize: 16, textColor: .shadowGrey900, fontWeight: emphasized ? .bold : .medium)
        }
    }
}

#Preview {
    CheckoutScreen()
}
