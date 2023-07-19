
import SwiftUI

struct Profile_View: View {
    @Binding var first: String
    @Binding var last: String
    @Binding var number: String
    @Binding var address: String
    @Binding var username: String
    @Binding var age: String
    @Binding var major: String
    @Binding var password: String
    
    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .leading, spacing: 40) {
                Image(systemName: "person.crop.circle")
                    .foregroundColor(Color.black)
                    .font(.system(size:100.0))
                //contains name and username
                VStack (alignment: .leading, spacing: 5){
                    Text("\(first) \(last)")
                        .font(.custom("Arial", fixedSize: 20))
                        .bold()
                    Text(username)
                        .font(.custom("Arial", fixedSize: 20))
                }
                //contains the my information section
                VStack (alignment: .leading, spacing: 5){
                    Text("My Information")
                        .font(.custom("Arial", fixedSize: 20))
                        .bold()
                    Text("Phone Number: \(number)")
                        .font(.custom("Arial", fixedSize: 17))
                    Text("Address: \(address)")
                        .font(.custom("Arial", fixedSize: 17))
                    Text("Age: \(age)")
                        .font(.custom("Arial", fixedSize: 17))
                    Text("Major: \(major)")
                        .font(.custom("Arial", fixedSize: 17))
                    //should password be displayed or be **** ?
                    Text("Password: \(password)")
                        .font(.custom("Arial", fixedSize: 17))
                }
                //to center align the button
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button("Edit Profile") {
                                        
                    }
                        .font(.custom("Bebas Neue", fixedSize: 20))
                        .foregroundColor(.white)
                        .frame(width: 110, height: 40)
                        .background(Color.blue)
                        .cornerRadius(15)
                    
                    Spacer()
                }
                
                
                
            }
            .padding(20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)

        }
    }
}

struct Profile_View_Previews: PreviewProvider {
    static var previews: some View {
        Profile_View(first: .constant("joe"), last: .constant("doe"), number: .constant("1234567890"), address: .constant("123 Main St"), username: .constant("user 1"), age: .constant("25"), major: .constant("Engineering"), password: .constant("mypassword"))
    }
}
