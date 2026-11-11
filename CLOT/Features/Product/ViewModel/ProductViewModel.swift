//
//  ProductViewModel.swift
//  CLOT
//
//  Created by Toluwalase on 06/11/2026.
//

import Foundation
import Combine

@MainActor
final class ProductViewModel: ObservableObject{
    @Published var products: [Product] = []
    @Published var selectedProduct: Product?
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    
    
    func fetchAllProduct() async{
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        do {
            let response: ProductsResponse =
            try await NetworkManager.shared.get(path: "/products")
            
            products = response.products
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func fetchProductByID(_ id: String) async {
        isLoading = true
        errorMessage = nil
        
        defer {
            isLoading = false
        }
        
        guard !id.isEmpty else{
            errorMessage = "Product ID is missing."
            return
        }
        
        do {
            let response: ProductResponse =
            try await NetworkManager.shared.get(path: "/products/\(id)")
            
            selectedProduct = response.product
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
}



