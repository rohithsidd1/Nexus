import SwiftUI

struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack(){
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150) // Fixed size for images
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 150)
            }
            
            VStack(alignment: .leading){
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                    .padding(.top)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(product.description)
                    .font(.caption)
                    .lineLimit(2)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity) // Ensures VStack takes up all available space in the grid item
        .frame(height: 300) // Fixed height for each product card
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 5))
    }
}
