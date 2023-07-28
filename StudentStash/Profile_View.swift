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
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    
    @State var hiddenPassword = ""
    @State private var showEditScreen = false
    
    var body: some View {
        ZStack{
            Color.white
            VStack(alignment: .leading, spacing: 40) {
                ZStack(alignment:.bottomTrailing){
                Button(action: {
                    changeProfileImage = true
                    openCameraRoll = true
                }, label: {
                    if changeProfileImage {
                        Image(uiImage:imageSelected)
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                    }
                    else{
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color.black)
                            .font(.system(size:100.0))
                }
                })
                    Image(systemName: "plus")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .offset(x:-6, y:-7)
                }.sheet(isPresented:$openCameraRoll){
                    ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                }
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
                    // password ****
                    Text("Password: \(hiddenPassword)")
                        .font(.custom("Arial", fixedSize: 17))
                }
                .onAppear {
                    hiddenPassword = String(repeating: "*", count: password.count)
                }
                //changes the hiddenPassword when the password changes
                .onChange(of: password) { newValue in
                    if newValue.count >= hiddenPassword.count {
                        hiddenPassword = String(repeating: "*", count: password.count)
                    } else {
                        hiddenPassword.removeLast()
                        hiddenPassword.append("*")
                    }
                }


                //to center align the button
                HStack(alignment: .center) {
                    Spacer()
                    
                    Button("Edit Profile") {
                        showEditScreen.toggle()
                    }
                        .font(.custom("Bebas Neue", fixedSize: 20))
                        .foregroundColor(.white)
                        .frame(width: 110, height: 40)
                        .background(Color.blue)
                        .cornerRadius(15)
                    
                        .sheet(isPresented: $showEditScreen) {
                            ScrollView {
                                Text("Edit Profile")
                                    .font(.custom("Arial", fixedSize: 25))
                                    .bold()
                                VStack(alignment: .leading, spacing: 15) {
                                    HStack {
                                        Text("First Name:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(first)", text: $first)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    
                                    HStack {
                                        Text("Last Name:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(last)", text: $last)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    HStack {
                                        Text("Phone Number:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(number)", text: $number)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    HStack {
                                        Text("Address:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(address)", text: $address)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    HStack {
                                        Text("Age:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(age)", text: $age)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    HStack {
                                        Text("Major:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(major)", text: $major)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    HStack {
                                        Text("Password:")
                                            .frame(width: 110, height: 30)
                                        TextField("\(password)", text: $password)
                                            .frame(width: 150, height: 30)
                                            .background(Color.black.opacity(0.05))
                                    }
                                    .font(.custom("Arial", fixedSize: 15))
                                    
                                }
                                
                                Button("Confirm Changes") {
                                    showEditScreen.toggle()
                                }
                                .font(.custom("Bebas Neue", fixedSize: 20))
                                .foregroundColor(.white)
                                .frame(width: 150, height: 40)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .padding(.top, 20)
                            }
                            // adds space above the scrollview
                            .padding(.top, 20)
                            
                        }
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

