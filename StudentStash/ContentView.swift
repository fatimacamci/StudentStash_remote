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
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var error = ""
    
    
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
                        NavigationLink("Sign up",destination: SignUpScreen())
                        //Button("Sign Up"){
                            //navigate to new page
                        //}
                        //.font(.custom("Bebas Neue", fixedSize: 20))
                        //.foregroundColor(.white)
                        //.frame(width: 300, height: 40)
                        //.background(Color.black)
                        //.cornerRadius(15)
                    }
                    
                }
            }
            .navigationBarHidden(true)
            
        }
    }


    func verify_user(username:String, password:String){
        if (username.contains(".edu")){
            wrongUsername = 0
        }
        else{
            wrongUsername = 2
        }
}
}

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
            .navigationTitle("Create a profile")
            .navigationBarBackButtonHidden(true)
            
        }
    }
        
    
}

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

