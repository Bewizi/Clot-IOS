import SwiftUI

struct TopSelling: View {
    let products: [Product]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                AppText(title: "Top Selling", fontSize: 16, textColor: .shadowGrey900, fontWeight: .bold)
                Spacer()
                NavigationLink(destination: EmptyView()) {
                    AppText(title: "See All", fontSize: 16, textColor: .shadowGrey900, fontWeight: .regular)
                }
            }
            .padding(.bottom, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment: .top, spacing: 12) {
                    ForEach(products) { product in
                        NavigationLink{
                            ProductDetails(product: product)
                                .navigationBarBackButtonHidden()
                        }label: {
                            ProductsCard(product: product)
                        }
                        
                            
                    }
                }
            }
        }
    }
}

#Preview {
    TopSelling(products: allProducts.filter { $0.status == "topSelling" })
}
