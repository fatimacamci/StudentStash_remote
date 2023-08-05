import SwiftUI
import UIKit

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
                    .foregroundColor(.black)
                    .imageScale(.medium)

                Text(title)
                    .foregroundColor(.black)
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
                    .foregroundColor(.black)
                    .imageScale(.large)

                Text(categoryName)
                    .foregroundColor(.black)
                    .font(.custom("Bebas Neue", size: 15))

                Spacer()

                Image(systemName: isExpanded ? "minus.circle" : "plus.circle")
                    .foregroundColor(.black)
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
            Color(red: 254 / 255.0, green: 166 / 255.0, blue: 237 / 255.0)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct MenuView: View {
    var body: some View {
        //ScrollView{
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
                    Subcategory(name: "Cars", isCompleted: false),
                    Subcategory(name: "Motorcycles", isCompleted: true),
                    Subcategory(name: "Scooters", isCompleted: false)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Books",
                iconSystemName: "book.circle",
                subcategories: [
                    Subcategory(name: "School Books", isCompleted: false),
                    Subcategory(name: "Regular Books", isCompleted: true)
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
                    Subcategory(name: "Male", isCompleted: true),
                    Subcategory(name: "Female", isCompleted: true),
                    Subcategory(name: "Unisex", isCompleted: true),
                    Subcategory(name: "Hats", isCompleted: false),
                    Subcategory(name: "Jackets", isCompleted: true),
                    Subcategory(name: "formal clothing", isCompleted: true),
                    Subcategory(name: "Shirts", isCompleted: true),
                    Subcategory(name: "Pants", isCompleted: true),
                    Subcategory(name: "Scarfs", isCompleted: true),
                    Subcategory(name: "Socks", isCompleted: true),
                    
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Home Goods",
                iconSystemName: "house.circle",
                subcategories: [
                    Subcategory(name: "Living Room", isCompleted: false),
                    Subcategory(name: "Kitchen", isCompleted: true),
                    Subcategory(name: "Bathroom", isCompleted: true),
                    Subcategory(name: "Bedroom", isCompleted: true),
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Electronics",
                iconSystemName: "tv.circle",
                subcategories: [
                    Subcategory(name: "Video Games", isCompleted: false),
                    Subcategory(name: "Television", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)
            CategoryView(
                categoryName: "Furniture",
                iconSystemName: "bed.double.circle",
                subcategories: [
                    Subcategory(name: "Sofa", isCompleted: false),
                    Subcategory(name: "Table", isCompleted: true),
                    Subcategory(name: "Bed", isCompleted: true),
                    Subcategory(name: "Chairs", isCompleted: true)
                ]
            )
            .padding(.bottom, 0)

            // Add more CategoryViews for other categories
        }
        .padding()
        .background(
            Color(red: 254 / 255.0, green: 166 / 255.0, blue: 237 / 255.0)
                .edgesIgnoringSafeArea(.all)
        )
        .edgesIgnoringSafeArea(.all)
            
        //.background(Color.black)
    }
}

