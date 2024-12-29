//import SwiftUI
//import SwiftSoup
//
//struct BookDetailView: View {
//    let book: Book
//    @State private var bookContent: String? = nil
//    @State private var isLoading = false
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 15) {
//                if let imageUrl = book.volumeInfo.imageLinks?.thumbnail,
//                   let url = URL(string: imageUrl.replacingOccurrences(of: "http://", with: "https://")) {
//                    AsyncImage(url: url, content: { image in
//                        image.resizable().scaledToFit()
//                    }, placeholder: {
//                        Color.gray
//                    })
//                    .frame(width: 200, height: 300)
//                    .cornerRadius(10)
//                    .padding()
//                }
//                
//                Text(book.volumeInfo.title)
//                    .font(.title)
//                    .fontWeight(.bold)
//                
//                if let authors = book.volumeInfo.authors {
//                    Text(authors.joined(separator: ", "))
//                        .font(.subheadline)
//                        .foregroundColor(.gray)
//                }
//                
//                if let description = book.volumeInfo.description {
//                    Text(description)
//                        .font(.body)
//                        .padding(.top, 10)
//                } else {
//                    Text("No description available.")
//                        .font(.body)
//                        .padding(.top, 10)
//                }
//                
//                // Check if there's a link to read the book
//                if let readLink = book.volumeInfo.previewLink,
//                   let url = URL(string: readLink) {
//                    Button(action: {
//                        fetchBookContent(url: url)
//                    }) {
//                        Text("Read Book")
//                            .font(.title2)
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.blue)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 20)
//                }
//                
//                // Show the book content if it is available
//                if let content = bookContent {
//                    Text(content)
//                        .padding()
//                        .font(.body)
//                        .lineLimit(nil) // Allow the content to be displayed fully
//                } else if isLoading {
//                    ProgressView("Loading content...")
//                }
//            }
//            .padding()
//        }
//        .navigationTitle(book.volumeInfo.title)
//        .navigationBarTitleDisplayMode(.inline)
//    }
//    
//    // Fetch the content and parse it
//    private func fetchBookContent(url: URL) {
//        isLoading = true
//        
//        // Fetch HTML content using URLSession
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            DispatchQueue.main.async {
//                guard let data = data, error == nil else {
//                    self.isLoading = false
//                    self.bookContent = "Failed to load content."
//                    return
//                }
//                
//                do {
//                    // Parse HTML content using SwiftSoup
//                    let document = try SwiftSoup.parse(String(data: data, encoding: .utf8) ?? "")
//                    
//                    // Extract text (you may need to modify this based on actual HTML structure)
//                    let textContent = document.body()?.text() ?? "No content available."
//                    
//                    // Update the bookContent with parsed text
//                    self.bookContent = textContent
//                } catch {
//                    self.bookContent = "Failed to parse content."
//                }
//                
//                self.isLoading = false
//            }
//        }.resume()
//    }
//}
