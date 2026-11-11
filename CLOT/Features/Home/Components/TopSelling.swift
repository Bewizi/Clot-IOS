import SwiftUI

struct TopSelling: View {
    let products: [Product]
    let isLoading: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                AppText(title: "Top Selling", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                Spacer()
                NavigationLink{
                    TopSellingProduct(products: products)
                        .navigationBarBackButtonHidden()
                }
            label:
                {
                    AppText(title: "See All", fontSize: 16, textColor: .shadowGrey900, fontWeight: .regular)
                }
                .navigationBarBackButtonHidden()
            }
            .padding(.bottom, 16)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(products) { product in
                        NavigationLink{
                            ProductDetails(product: product)
                                .navigationBarBackButtonHidden()
                        }label: {
                            ProductsCard(product: product, isLoading: isLoading)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TopSelling(products: allProducts.filter { $0.status == "topSelling" }, isLoading: true)
}
