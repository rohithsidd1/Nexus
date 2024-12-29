import SwiftUI

struct SortedProductsView: View {
    let category: String
    let products: [Product]

    var filteredProducts: [Product] {
        products.filter { $0.category == category }
    }

    let columns = [
        GridItem(.flexible()), // Column 1
        GridItem(.flexible())  // Column 2
    ]

    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(filteredProducts) { product in
                        ProductCardView(product: product)
                            .frame(maxWidth: .infinity) // Ensure cards take up full width of each grid item
                    }
                }
                .padding()
            }
        }
        .navigationTitle(category)
    }
}
