import SwiftUI

struct Settings_View: View {
    @State private var showTerms = false
    @State private var showPrivacy = false
    @State private var showSubscription = false
    @State private var showNotifications = false
    
    @State private var publicLastName = false
    @State private var publicMajor = false
    @State private var publicPicture = false
    @State private var enableMessageNotifications = false
    @State private var enableNewUploadNotifications = false
    
    @State private var isShowingPopUp = false
    
    var body: some View {
        ZStack{
            Color.white
                    VStack(alignment: .center, spacing: 20) {
                        Image("StudentStash_Logo")
                            .resizable()
                            .frame(width: 150, height: 150)
                        
                        HStack {
                            Spacer()
                            Text("Settings")
                                .font(.custom("Bebas Neue", fixedSize: 30))
                            Spacer()
                        }
                        .padding(.bottom, 30)
                Button("Terms of Use") {
                    showTerms.toggle()
                }
                .sheet(isPresented: $showTerms) {
                    Text("insert entire terms of use")
                }
                
                Button("Privacy") {
                    showPrivacy.toggle()
                }
                .sheet(isPresented: $showPrivacy) {
                    Toggle("Show my last name to the public", isOn: $publicLastName)
                    Toggle("Show my major to the public", isOn: $publicMajor)
                    Toggle("Show my profile picture to the public", isOn: $publicPicture)
                    Button("Confirm Changes") {
                        showPrivacy.toggle()
                    }
                    .font(.custom("Bebas Neue", fixedSize: 20))
                    .foregroundColor(.white)
                    .frame(width: 150, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding()
                }
                
                Button("Purchase Subscription") {
                    showSubscription.toggle()
                }
                .sheet(isPresented: $showSubscription) {
                    Text("please try again later")
                }
                
                Button("Notifications") {
                    showNotifications.toggle()
                }
                .sheet(isPresented: $showNotifications) {
                    Toggle("Message Notifications", isOn: $enableMessageNotifications)
                    Toggle("New Post Notifications", isOn: $enableNewUploadNotifications)
                    Button("Confirm Changes") {
                        showNotifications.toggle()
                    }
                    .font(.custom("Bebas Neue", fixedSize: 20))
                    .foregroundColor(.white)
                    .frame(width: 150, height: 40)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .padding()
                }
                Button("Log Out") {
                    //add a pop up with two options: log out and stay signed in
                    isShowingPopUp = true
                }
                .fullScreenCover(isPresented: $isShowingPopUp, content: {
                            PopUpView(isPresented: $isShowingPopUp)
                        })
                
            }
            .font(.custom("Bebas Neue", fixedSize: 20))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .padding(40)
        }
}
}

struct Settings_View_Previews: PreviewProvider {
    static var previews: some View {
        Settings_View()
    }
}

struct PopUpView: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.4).edgesIgnoringSafeArea(.all)
            VStack {
                Text("Do you want to log out?")
                    .font(.headline)
                    .padding()

                HStack(spacing: 20) {
                    Button("Log Out") {
                        isPresented = false // Close the pop-up after handling the action
                        
                    }
                    .frame(maxWidth: 100)
                    .padding()

                    Button("Stay Signed In") {
                        isPresented = false // Close the pop-up after handling the action
                    }
                    .frame(maxWidth: 100)
                }
                .padding()

            }
            .background(Color.white)
            .cornerRadius(10)
            .padding()
        }
    }
}


