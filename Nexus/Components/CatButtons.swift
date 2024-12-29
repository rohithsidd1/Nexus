import SwiftUI

struct CategoryButtonsView: View {
    @Binding var selectedCategory: String? // Binding to the selected category
    let categories: [String] // List of categories
    let products: [Product] // Full product list

    var body: some View {
        HStack(spacing: 42) { // Add spacing between buttons
            ForEach(categories, id: \.self) { category in
                NavigationLink(
                    destination: SortedProductsView(category: category, products: products)) {
                    VStack {
                        Image(systemName: "star.fill") // Replace with the appropriate image for each category
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40) // Adjust size as needed
                            .padding(8)
                            .background(selectedCategory == category ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(.white)
                            .clipShape(Circle()) // Makes the button circular

                        Text(category) // Title for each category button
                            .font(.caption)
                            .foregroundColor(.black) // Title color
                    }
                }
            }
        }
    }
}
