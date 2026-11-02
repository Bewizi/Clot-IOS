//
//  OrderSuccessfulView.swift
//  CLOT
//
//  Created by Toluwalase on 02/11/2026.
//

import SwiftUI

struct OrderSuccessfulView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                
                                    
                
                Color.mediumSlateBlue300
                    .ignoresSafeArea()
                
                


                VStack(spacing: 0) {
                    Spacer(minLength: 0)

                    AppText(
                        title: "Order Placed\nSuccessfully",
                        fontSize: 32,
                        textColor: .shadowGrey900,
                        fontWeight: .bold,
                        textAlignment: .center
                    )
                    .lineSpacing(6)

                    AppText(
                        title: "You will recieve an email confirmation",
                        fontSize: 16,
                        textColor: .shadowGrey900.opacity(0.5),
                        fontWeight: .regular,
                        textAlignment: .center
                    )
                    .padding(.top, 64)

                    Spacer(minLength: 0)

                    Button {
                        dismiss()
                    } label: {
                        AppText(
                            title: "See Order details",
                            fontSize: 16,
                            textColor: .white,
                            fontWeight: .regular
                        )
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                    }
                    .background(Color.mediumSlateBlue300)
                    .clipShape(Capsule())
                    .padding(.horizontal, 24)
                    .padding(.bottom, 28)
                }
                .padding(.top, 48)
                .frame(maxWidth: .infinity)
                .frame(height: proxy.size.height * 0.52)
                .background(Color.whiteSmoke50)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 44,
                        bottomLeadingRadius: 44,
                        bottomTrailingRadius: 44,
                        topTrailingRadius: 44
                    )
                )
                .padding(.bottom, proxy.size.height * -0.05)
                
                
                
                
                Image("orderSuccessImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: min(proxy.size.width - 48, 390), height: 390)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .padding(.bottom, proxy.size.height * 0.50)
            }
        }
    }
}

#Preview {
    OrderSuccessfulView()
}
