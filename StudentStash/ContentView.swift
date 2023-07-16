//
//  ContentView.swift
//  StudentStash
//
//  Created by Fatima Camci on 6/24/23.
//

import SwiftUI

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
    @State private var bikeButtonPressed = false
    @State private var vehiclesButtonPressed = false
    @State private var electronicsButtonPressed = false
    @State private var clothesButtonPressed = false
    @State private var homeGoodsButtonPressed = false
    @State private var furnitureButtonPressed = false
    @State private var add1ButtonPressed = false
    @State private var add2ButtonPressed = false
    @State private var add3ButtonPressed = false
    
    
    var body: some View {
        NavigationView{
        
            ZStack{
                Color.white
                    .ignoresSafeArea()
                VStack{
                    Text("Welcome to Student Stash!")
                        .font(.custom("Arial", fixedSize: 25)
                        )
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
                    VStack(spacing:150){
                        Button("Login"){
                            verify_user(username: username, password: password)
                        }
                        .font(.custom("Bebas Neue", fixedSize: 20))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(15)
                        // redirects to another page
                        //NavigationLink("Sign up",destination: SignUpScreen())
                        Button("Sign Up"){
                            showSignupSheet.toggle()
                        }
                        .font(.custom("Bebas Neue", fixedSize: 20))
                        .foregroundColor(.white)
                        .frame(width: 300, height: 40)
                        .background(Color.black)
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
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.blue)
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
                                        Button("Bikes") {
                                            bikeButtonPressed.toggle()
                                            interests.append("Bikes")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(bikeButtonPressed ? Color.gray : Color.black)
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
                                        Button("Add more") {
                                            add1ButtonPressed.toggle()
                                            interests.append("add more")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(add1ButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Add more") {
                                            add2ButtonPressed.toggle()
                                            interests.append("add more")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(add2ButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                        
                                        Button("Add more") {
                                            add3ButtonPressed.toggle()
                                            interests.append("add more")
                                        }
                                        .font(.custom("Bebas Neue", fixedSize: 20))
                                        .foregroundColor(.white)
                                        .frame(width: 100, height: 100)
                                        .background(add3ButtonPressed ? Color.gray : Color.black)
                                        .cornerRadius(15)
                                    }
                                    Button("Confirm") {
                                        showInterestsSheet.toggle()
                                        showSignupSheet.toggle()
                                        //MUST take user to the main page
                                        //CONTINUE HERE
                                    }
                                    .font(.custom("Bebas Neue", fixedSize: 20))
                                    .foregroundColor(.white)
                                    .frame(width: 200, height: 50)
                                    .background(Color.blue)
                                    .cornerRadius(15)
                                }
                        }
                        
                        
                            
                        }
                    }
                    
                }
            }
            .navigationBarHidden(true)
            
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
//old code, written before the sheets. delete later
/*
struct SignUpScreen: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var username = ""
    @State private var password = ""
    @State private var number = ""
    @State private var address = ""
    @State private var gender = ""
    @State private var age = ""
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                Color.white
                    .ignoresSafeArea()
                    
                VStack(spacing:20){
                    Text("Create a profile")
                        .font(.custom("Arial", fixedSize: 25)
                        )
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
                    NavigationLink("Confirm", destination:MainScreen())
                    
                }
                
                
            }
            //.navigationTitle("Create a profile")
            .navigationBarHidden(true)
            
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
}
 */


//the home page where the main of the app is
struct MainScreen: View {
    var body: some View {
        Text("main page")
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

