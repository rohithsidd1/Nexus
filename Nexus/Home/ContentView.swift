import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ProductViewModel()

    let columns = [
        GridItem(.flexible()), // Column 1
        GridItem(.flexible())  // Column 2
    ]

    var body: some View {
        VStack {
            // Search Bar
            SearchBar(searchText: $viewModel.searchText)
                .padding(.top)

            // Category Buttons
            CategoryButtonsView(
                selectedCategory: $viewModel.selectedCategory,
                categories: viewModel.categories,
                products: viewModel.products
            )
            .padding(.horizontal)
            .padding(.top)

            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding()
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                // Product Grid
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(viewModel.filteredProducts) { product in
                            ProductCardView(product: product)
                                .frame(maxWidth: .infinity) // Ensure cards take up full width of each grid item
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}
