import SwiftUI

//struct CustomColor {
    //static let myColor = Color("Gradient_Color")
//}
struct ContentView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var error = ""
    
    @State private var showSignupSheet = false
    @State private var showInterestsSheet = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var number = ""
    @State private var address = ""
    @State private var gender = ""
    @State private var age = ""
    @State private var major = ""
    @State private var interests = []
    
    //variables to check if buttons are pressed in the interests sheet
    @State private var bicyclesButtonPressed = false
    @State private var vehiclesButtonPressed = false
    @State private var electronicsButtonPressed = false
    @State private var clothesButtonPressed = false
    @State private var homeGoodsButtonPressed = false
    @State private var furnitureButtonPressed = false
    @State private var booksButtonPressed = false
    @State private var subleaseButtonPressed = false
    @State private var accessoriesButtonPressed = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Gradient_Color")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack(alignment: .center, spacing:20){
                   Image("Logo")
                        .resizable()
                        .frame(width:150, height:150)
                    Spacer()
                }
                .padding(.top,60)
                VStack{
                    Text("Welcome to Student Stash!")
                        .font(.custom("Arial", fixedSize: 25))
                        .bold()
                        .padding()
                    TextField("Username", text:$username)
                        .font(.custom("Arial", fixedSize: 15))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        //.cornerRadius(5)
                        .border(.red, width: CGFloat(wrongUsername))
                    TextField("Password", text:$password)
                        .font(.custom("Arial", fixedSize: 15))
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        //.cornerRadius(5)
                        .border(.red, width: CGFloat(wrongPassword))
                    // once the user has created a profile, ask them to log in, so the log in button will lead to the main page
                    VStack(spacing:150){
                        /* Button("Login"){
                            verify_user(username: username, password: password)
                        }
                        .font(.custom("Bebas Neue", fixedSize: 20))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15) */
                        // redirects to another page
                        NavigationLink(
                            destination: MainScreen(first: $firstName, last: $lastName, number: $number, address: $address, username: $username, age: $age, major: $major, password: $password)
                        ) {
                            Text("Log In")
                                .font(.custom("Bebas Neue", size: 22)) // Change "YourCustomFontName" to the desired font name
                                .foregroundColor(.black)
                        }

                        /*NavigationLink("LOG IN",destination: MainScreen(first: $firstName, last: $lastName, number: $number, address: $address, username: $username, age: $age, major: $major, password: $password))
                        */
                        Button("Sign Up"){
                            showSignupSheet.toggle()
                        }
                        .font(.custom("Bebas Neue", fixedSize: 20))
                        .foregroundColor(.white)
                        .frame(width: 300, height: 40)
                        .background(.black)
                        .cornerRadius(15)
                        
                        .sheet(isPresented: $showSignupSheet) {
                            ScrollView {
                                Text("Create a profile")
                                    .font(.custom("Arial", fixedSize: 25))
                                    .bold()
                                    .padding()
                                VStack(spacing:20){
                                    TextField("First Name", text:$firstName)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Last Name", text:$lastName)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Username", text:$username)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Password", text:$password)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Confirm Password", text:$confirmPassword)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Phone Number", text:$number)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Address", text:$address)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Gender", text:$gender)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Age", text:$age)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                    TextField("Major", text:$major)
                                        .font(.custom("Arial", fixedSize: 15))
                                        .padding()
                                        .frame(width: 300, height: 50)
                                        .background(Color.black.opacity(0.05))
                                }
                                
                                Button("Next"){
                                    //line below commented out for ease of testing UNCOMMENT
                                    //verify_user(username: username, password: password)
                                    showInterestsSheet.toggle()
                                }
                                .font(.custom("Bebas Neue", fixedSize: 20))
                                .foregroundColor(.black)
                                .frame(width: 200, height: 50)
                                .background(Color(red: 254/255, green: 166/255, blue: 237/255))
                                .cornerRadius(15)
                                
                            }
                            
                            //layout for the second sheet, showing the interests page
                            .sheet(isPresented: $showInterestsSheet) {
                                VStack(spacing:20){
                                    Text("Let's personalize your experience!")
                                        .font(.custom("Arial", fixedSize: 25))
                                        .bold()
                                    Text("Pick at least 3 categories to continue")
                                        .font(.custom("Arial", fixedSize: 20))
                                    HStack {
                                        Button("Bicycles") {
                                            bicyclesButtonPressed.toggle()
                                            interests.append("Bicycles")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(bicyclesButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Vehicles") {
                                            vehiclesButtonPressed.toggle()
                                            interests.append("Vehicles")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(vehiclesButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Electronics") {
                                            electronicsButtonPressed.toggle()
                                            interests.append("Electronics")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(electronicsButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                    }
                                    HStack {
                                        Button("Clothes") {
                                            clothesButtonPressed.toggle()
                                            interests.append("Clothes")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(clothesButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        Button("Home Goods") {
                                            homeGoodsButtonPressed.toggle()
                                            interests.append("Home Goods")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(homeGoodsButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Furniture") {
                                            furnitureButtonPressed.toggle()
                                            interests.append("Furniture")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(furnitureButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                    }
                                    //IMPORTANT: CHANGE THE NAMES OF THE BUTTON CHECKER BOOLEANS WHEN RENAMING THE BUTTONS
                                    HStack {
                                        Button("Books") {
                                            booksButtonPressed.toggle()
                                            interests.append("Books")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(booksButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Sublease") {
                                            subleaseButtonPressed.toggle()
                                            interests.append("Sublease")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(subleaseButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Accessories") {
                                            accessoriesButtonPressed.toggle()
                                            interests.append("add more")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(accessoriesButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                    }
                                    Button("Confirm") {
                                        showInterestsSheet.toggle()
                                        showSignupSheet.toggle()
                                        //navigates to log in page for user to log in
                                    }
                                    .font(.custom("Bebas Neue", fixedSize: 20))
                                    .foregroundColor(.black)
                                    .frame(width: 200, height: 50)
                                    .background(Color(red: 254/255, green: 166/255, blue: 237/255))
                                    .cornerRadius(15)
                        }
                        
                        
                            
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
        }
    }
}

//make sure the password and confirm password match
    func verify_user(username:String, password:String){
        if (username.contains(".edu")){
            wrongUsername = 0
        }
        else{
            wrongUsername = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


