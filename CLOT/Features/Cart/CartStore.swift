import SwiftUI
import Combine

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    let size: String
    let color: String
    var quantity: Int
}
@MainActor
final class CartStore: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    @Published var isAddingToCart = false
    @Published var errorMessage: String?
    
    var subtotal: Double { items.reduce(0) { $0 + $1.product.price * Double($1.quantity) } }
    
    func add(
        product: Product,
        size: String,
        color: String,
        quantity: Int
    )async {
        guard let token = UserDefaults.standard.string(forKey: "authToken")
                else{
            errorMessage = "You must be logged in"
            return
        }
        
        isAddingToCart = true
        errorMessage = nil
        
        defer{
            isAddingToCart = false
        }
        
        do {
            let savedCart = try await NetworkManager.shared.addToCart(
                product: product,
                size: size,
                color: color,
                quantity: quantity,
                token: token
            )
            
            
            addLocally(
                product: product,
                size: size,
                color: color,
                quantity: quantity
            )
        }catch{
            errorMessage = error.localizedDescription
        }
    }

  private  func addLocally(product: Product, size: String, color: String, quantity: Int) {
        if let index = items.firstIndex(where: { $0.product.name == product.name && $0.size == size && $0.color == color }) {
            items[index].quantity += quantity
        } else { items.append(CartItem(product: product, size: size, color: color, quantity: quantity)) }
    }
    func increase(_ item: CartItem) { if let i = items.firstIndex(where: { $0.id == item.id }) { items[i].quantity += 1 } }
    func decrease(_ item: CartItem) {
        guard let i = items.firstIndex(where: { $0.id == item.id }) else { return }
        if items[i].quantity > 1 { items[i].quantity -= 1 } else { items.remove(at: i) }
    }
    func removeAll() { items.removeAll() }
}
