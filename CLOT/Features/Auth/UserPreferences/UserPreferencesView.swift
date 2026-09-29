import SwiftUI

struct UserPreferencesView: View {
    let token: String
    @StateObject private var viewModel = UserPreferencesViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 32) {
            AppText(
                title: "Tell us About yourself",
                fontSize: 24,
                textColor: .shadowGrey900,
                fontWeight: .bold
            )

            VStack(alignment: .leading, spacing: 12) {
                AppText(
                    title: "Who do you shop for ?",
                    fontSize: 16,
                    textColor: .shadowGrey900,
                    fontWeight: .bold
                )

                HStack(spacing: 12) {
                    GenderSelectionButton(
                        title: "Men",
                        isSelected: viewModel.selectedShoppingFor == "men"
                    ) {
                        viewModel.selectedShoppingFor = "men"
                    }

                    GenderSelectionButton(
                        title: "Women",
                        isSelected: viewModel.selectedShoppingFor == "women"
                    ) {
                        viewModel.selectedShoppingFor = "women"
                    }
                }
            }

            VStack(alignment: .leading, spacing: 12) {
                AppText(
                    title: "How Old are you ?",
                    fontSize: 16,
                    textColor: .shadowGrey900,
                    fontWeight: .bold
                )

                Menu {
                    Button("18 - 24") { viewModel.selectedAgeRange = "18-24" }
                    Button("25 - 34") { viewModel.selectedAgeRange = "25-34" }
                    Button("35 - 44") { viewModel.selectedAgeRange = "35-44" }
                } label: {
                    HStack {
                        Text(
                            viewModel.selectedAgeRange.isEmpty
                                ? "Age Range"
                                : viewModel.selectedAgeRange
                        )
                        .foregroundStyle(
                            viewModel.selectedAgeRange.isEmpty ? .gray : .primary
                        )

                        Spacer()

                        Image(systemName: "chevron.down")
                            .foregroundStyle(.gray)
                    }
                    .padding()
                    .background(.midnightViolet900)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
                }
            }

            Spacer()

            Button {
                Task {
                    await viewModel.save(token: token)
                }
            } label: {
                Group {
                    if viewModel.isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Finish")
                    }
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            }
            .background(Capsule().fill(Color.mediumSlateBlue300))
            .disabled(viewModel.isLoading)
        }
        .padding(.horizontal, 24)
        .background(.whiteSmoke50)
        .safeAreaInset(edge: .bottom) {}
        .alert(
            "Preferences Error",
            isPresented: Binding(
                get: { viewModel.errorMessage != nil },
                set: { if !$0 { viewModel.errorMessage = nil } }
            )
        ) {
            Button("OK") {
                viewModel.errorMessage = nil
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}
