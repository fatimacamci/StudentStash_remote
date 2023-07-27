import SwiftUI

struct Post_View: View {
    @State private var product_name = ""
    @State private var price = ""
    @State private var description = ""
    
    var body: some View {
        ZStack {
            Color.white
        VStack(alignment: .leading, spacing:5) {
            Text("Photos")
                .font(.custom("Bebas Neue", size:18))
            VStack(alignment: .leading, spacing:20){
                Button(action: {
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 50.0))
                            }
                            .buttonStyle(PlainButtonStyle()) // Use PlainButtonStyle to remove the default button style

                Text("Product Name")
                    .font(.custom("Bebas Neue", size: 18))
            }
                TextField("", text: $product_name)
                    .font(.custom("Bebas Neue", size: 18))
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(.white)
                    .cornerRadius(5)
                    .border(.black)
                Text("Price")
                    .font(.custom("Bebas Neue", size:18))
                TextField("", text: $price)
                    .font(.custom("Bebas Neue", size: 18))
                    .padding()
                    .frame(width: 300, height: 40)
                    .background(.white)
                    .cornerRadius(5)
                    .border(.black)
                Text("Condition")
                    .font(.custom("Bebas Neue", size:18))
                CustomDropdownMenu()
                Text("Description")
                    .font(.custom("Bebas Neue", size: 18))
            TextField("", text: $description)
                .font(.custom("Bebas Neue", size: 18))
                .padding()
                .frame(maxWidth:300)
                .background(.white)
                .cornerRadius(5)
                .border(.black)
                .fixedSize(horizontal: false, vertical: true)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
            VStack(alignment: .leading, spacing:1){
                Text("Category")
                .font(.custom("Bebas Neue", size:18))
                    CheckboxView()
            Button("Upload"){
                }
                .font(.custom("Bebas Neue", fixedSize: 20))
                .foregroundColor(.white)
                .frame(width: 150, height: 40)
                .background(Color.black)
                .cornerRadius(15)
            }
        }
    }
}
}
struct CheckboxView: View {
    let categories = ["Bicycles", "Vehicles", "Books", "Sublease", "Clothing", "Home Goods", "Electronics", "Furniture"]
    @State private var selectedStates: [Bool]
    init() {
        _selectedStates = State(initialValue: Array(repeating: false, count: categories.count))
    }

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<categories.count, id: \.self) { index in
                HStack {
                    Image(systemName: selectedStates[index] ? "checkmark.square" : "square")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(selectedStates[index] ? .black : .gray)
                        .onTapGesture{
                            selectedStates[index].toggle()
                        }

                    Text(categories[index])
                        .font(.custom("Bebas Neue", size:12))
                }
                .padding(.vertical, 4)
            }
        }
        .padding()
    }
}

struct Post_View_Previews: PreviewProvider {
    static var previews: some View {
        Post_View()
    }
}
