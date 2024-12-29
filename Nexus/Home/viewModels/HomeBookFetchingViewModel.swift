import Foundation

class ProductViewModel: ObservableObject {
    @Published var products = [Product]()
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    @Published var searchText = ""  // To handle the search text
    @Published var selectedCategory: String? = nil // To track the selected category
    
    private let productService = ProductService()
    
    // Fetch products and handle the response
    func fetchProducts() {
        isLoading = true
        errorMessage = nil
        
        productService.fetchProducts { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                
                switch result {
                case .success(let products):
                    self?.products = products
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }

    // Filtered products based on search text and selected category
    var filteredProducts: [Product] {
        var filtered = products
        
        // Filter by search text
        if !searchText.isEmpty {
            filtered = filtered.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
        
        // Filter by selected category
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category == category }
        }
        
        return filtered
    }
    
    // Get unique categories from the products
        var categories: [String] {
            let allCategories = products.map { $0.category }
            
            // Replace specific category names
            let transformedCategories = allCategories.map { category -> String in
                if category == "men's clothing" {
                    return "men"
                } else if category == "women's clothing" {
                    return "women"
                } else {
                    return category
                }
            }
            
            return Array(Set(transformedCategories)).sorted() // Remove duplicates and sort
        }

}
