import Foundation
import Combine

@MainActor
final class UserPreferencesViewModel: ObservableObject {
    @Published var selectedShoppingFor = "men"
    @Published var selectedAgeRange = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var saveSucceeded = false

    func save(token: String) async {
        guard !selectedAgeRange.isEmpty else {
            errorMessage = "Please select your age range."
            return
        }

        isLoading = true
        errorMessage = nil

        do {
            _ = try await NetworkManager.shared.savePreferences(
                shoppingFor: selectedShoppingFor,
                ageRange: selectedAgeRange,
                token: token
            )
            saveSucceeded = true
        } catch let error as APError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "Something went wrong. Please try again."
        }

        isLoading = false
    }
}
