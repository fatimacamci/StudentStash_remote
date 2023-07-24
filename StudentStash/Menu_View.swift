import SwiftUI

struct Subcategory: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted: Bool
}

struct SubcategoryItem: View {
    @State private var isChecked = false
    var title: String

    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .foregroundColor(.white)
                    .imageScale(.medium)

                Text(title)
                    .foregroundColor(.white)
                    .font(.custom("Bebas Neue", size: 12))

                Spacer()
            }
        }
        .foregroundColor(.white)
    }
}

struct CategoryView: View {
    @State private var isExpanded = false

    let categoryName: String
    let iconSystemName: String
    let subcategories: [Subcategory]

    var body: some View {
        VStack {
            HStack {
                Image(systemName: iconSystemName)
                    .foregroundColor(.white)
                    .imageScale(.large)

                Text(categoryName)
                    .foregroundColor(.white)
                    .font(.custom("Bebas Neue", size: 15))

                Spacer()

                Image(systemName: isExpanded ? "minus.circle" : "plus.circle")
                    .foregroundColor(.white)
                    .imageScale(.medium)
                    .onTapGesture {
                        isExpanded.toggle()
                    }
            }
            .padding(.top, 30)

            if isExpanded {
                VStack(alignment: .leading) {
                    ForEach(subcategories) { subcategory in
                        SubcategoryItem(title: subcategory.name)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.black, .black]),
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct MenuView: View {
    var body: some View {
        VStack(spacing:1) {
            CategoryView(
                categoryName: "Bicycles",
                iconSystemName: "bicycle.circle",
                subcategories: [
                    Subcategory(name: "Mountain Bike", isCompleted: false),
                    Subcategory(name: "BMX Bike", isCompleted: true),
                    Subcategory(name: "Cruiser Bike", isCompleted: false),
                    Subcategory(name: "Road Bike", isCompleted: true),
                    Subcategory(name: "Hybrid Bike", isCompleted: false)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Vehicles",
                iconSystemName: "car.circle",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Books",
                iconSystemName: "book.circle",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Sublease",
                iconSystemName: "doc.circle",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Clothes",
                iconSystemName: "tshirt",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Home Goods",
                iconSystemName: "house.circle",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Electronics",
                iconSystemName: "tv.circle",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Furniture",
                iconSystemName: "bed.double.circle",
                subcategories: [
                    Subcategory(name: "Subcategory 1", isCompleted: false),
                    Subcategory(name: "Subcategory 2", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)

            // Add more CategoryViews for other categories
        }
        .padding()
        .background(Color.black)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
