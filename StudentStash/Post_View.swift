import SwiftUI

struct Post_View: View {
    @State private var product_name = ""
    @State private var price = ""
    @State private var description = ""
    @State private var selectedImage: Image? = nil
    @State private var showActionSheet = false
    @State private var showImagePicker = false
    @State var ProfileImage = false
    @State var CameraRoll = false
    @State var imageSelected = UIImage()
    
    var body: some View {
        ScrollView{
            Color.white
            VStack(alignment: .center, spacing:5) {
                Text("Upload")
                    .font(.custom("Arial", size:18))
            Button(action: {
            ProfileImage = true
            CameraRoll = true
            }, label: {
            if ProfileImage {
                Image(uiImage:imageSelected)
                .resizable()
                .frame(width: 120, height: 120)
                //.clipShape(Circle())
            }
        else{
            Image(systemName: "plus.circle")
             .foregroundColor(Color.black)
             .font(.system(size:50.0))
            }
        })
        /*
        Image(systemName: "plus")
         .frame(width: 30, height: 30)
         .foregroundColor(.white)
         .background(Color.blue)
         .clipShape(Circle())
         .offset(x:-6, y:-7)
         */
        }.sheet(isPresented:$CameraRoll){
        ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
        }
            VStack(alignment: .leading, spacing:10){
                TextField("Product Name", text: $product_name)
                    .font(.custom("Arial", fixedSize: 15))
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                TextField("Price", text: $price)
                    .font(.custom("Arial", fixedSize: 15))
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                CustomDropdownMenu()
            }
                VStack(alignment: .leading, spacing:20) {
                    TextField("Description", text: $description)
                        .font(.custom("Arial", fixedSize: 15))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                    Text("Category")
                        .font(.custom("Arial", size:18))
                    CheckboxView()
                    }
                    Button("Upload"){
                        // Add code to handle the upload functionality
                    }
                    .font(.custom("Bebas Neue", fixedSize: 20))
                    .foregroundColor(.black)
                    .frame(width: 150, height: 40)
                    .background(Color(red: 254/255, green: 166/255, blue: 237/255))
                    .cornerRadius(15)
            }
        }
    }

struct CheckboxView: View {
    let categories = ["Bicycles", "Vehicles", "Books", "Sublease", "Clothing", "Home Goods", "Electronics", "Furniture"]
    let subcategories: [String: [String]] = [
        "Vehicles": ["Cars", "Motorcycles", "Trucks"],
        "Books": ["School Books","Regular Books"],
        "Clothing":["Male","Female","Unisex","Hats", "Jackets", "formal clothing","Shirts", "Pants", "Scarfs", "Socks"],
        "Home Goods": ["Living Room","Kitchen","Bathroom","Bedroom"],
        "Electronics":["Video Games","Television"],
        "Furniture":["Sofa","Table","Bed","Chairs"]
        // Define subcategories for other categories
    ]
    
    @State private var selectedStates: [Bool]
    @State private var selectedSubcategories: [String: [Bool]]
    
    init() {
        _selectedStates = State(initialValue: Array(repeating: false, count: categories.count))
        
        var subcategoryStates = [String: [Bool]]()
        for category in categories {
            subcategoryStates[category] = Array(repeating: false, count: subcategories[category]?.count ?? 0)
        }
        _selectedSubcategories = State(initialValue: subcategoryStates)
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(0..<categories.count / 2, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: selectedStates[index] ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(selectedStates[index] ? .black : .gray)
                                .onTapGesture{
                                    selectedStates[index].toggle()
                                }
                            
                            Text(categories[index])
                                .font(.custom("Arial", size:12))
                        }
                        
                        if selectedStates[index], let subcategoryList = subcategories[categories[index]] {
                            ForEach(0..<subcategoryList.count, id: \.self) { subIndex in
                                HStack {
                                    Image(systemName: selectedSubcategories[categories[index]]?[subIndex] ?? false ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(selectedSubcategories[categories[index]]?[subIndex] ?? false ? .black : .gray)
                                        .onTapGesture {
                                            selectedSubcategories[categories[index]]?[subIndex].toggle()
                                        }
                                    
                                    Text(subcategoryList[subIndex])
                                        .font(.custom("Arial", size:10))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 15) {
                ForEach(categories.count / 2..<categories.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image(systemName: selectedStates[index] ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundColor(selectedStates[index] ? .black : .gray)
                                .onTapGesture{
                                    selectedStates[index].toggle()
                                }
                            
                            Text(categories[index])
                                .font(.custom("Arial", size:12))
                        }
                        
                        if selectedStates[index], let subcategoryList = subcategories[categories[index]] {
                            ForEach(0..<subcategoryList.count, id: \.self) { subIndex in
                                HStack {
                                    Image(systemName: selectedSubcategories[categories[index]]?[subIndex] ?? false ? "checkmark.square" : "square")
                                        .resizable()
                                        .frame(width: 9, height: 9)
                                        .foregroundColor(selectedSubcategories[categories[index]]?[subIndex] ?? false ? .black : .gray)
                                        .onTapGesture {
                                            selectedSubcategories[categories[index]]?[subIndex].toggle()
                                        }
                                    
                                    Text(subcategoryList[subIndex])
                                        .font(.custom("Arial", size:9))
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}







struct Post_View_Previews: PreviewProvider {
    static var previews: some View {
        Post_View()
    }
}
