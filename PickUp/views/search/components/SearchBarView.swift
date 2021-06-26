import SwiftUI
import UIKit
struct SearchBarView: View {

    @Binding var text: String
    var placeholder: String

    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(Color("Text"))
            
            TextField(placeholder, text: $text)
                .foregroundColor(Color("Text"))
        }
        .padding(.vertical,10)
        .padding(.horizontal)
        .background(Color.gray.opacity(0.3))
        .cornerRadius(20)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant(""), placeholder: "")
    }
}
