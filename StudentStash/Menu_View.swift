import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            Text("Categories")
                .font(.custom("Bebas Neue", fixedSize: 20))
                .foregroundColor(.white)
            }
            .padding(.top, 130)
            HStack{
                Image(systemName: "bicycle.circle")
                    .foregroundColor(.white)
                    .imageScale(.large)
                Text("Bicycles")
                    .foregroundColor(.white)
                    .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        HStack{
            Image(systemName: "car.circle")
                .foregroundColor(.white)
                .imageScale(.large)
            Text("Vehicles")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
        }
        .padding(.top,30)
        HStack{
            Image(systemName: "book.circle")
                .foregroundColor(.white)
                .imageScale(.large)
            Text("Books")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        HStack{
            Image(systemName: "doc.circle")
                .foregroundColor(.white)
                .imageScale(.large)
            Text("Sublease")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        HStack{
            Image(systemName:"tshirt.fill")
                .foregroundColor(.white)
                .imageScale(.small)
            Text("Clothing")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        HStack{
            Image(systemName: "house.circle")
                .foregroundColor(.white)
                .imageScale(.large)
            Text("Home Goods")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        HStack{
            Image(systemName: "tv.circle")
                .foregroundColor(.white)
                .imageScale(.large)
            Text("Electronics")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        HStack{
            Image(systemName: "bed.double.circle")
                .foregroundColor(.white)
                .imageScale(.large)
            Text("Furniture")
                .foregroundColor(.white)
                .font(.custom("Bebas Neue", fixedSize: 18))
            }
        .padding(.top,30)
        Spacer()
    }
        .padding()
        .frame(maxWidth: .infinity, alignment:.leading)
        //.background(Color(red: 32/255, green:32/255, blue:32/255))
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
