import SwiftUI

struct MainScreen: View {
    @Binding var first: String
    @Binding var last: String
    @Binding var number: String
    @Binding var address: String
    @Binding var username: String
    @Binding var age: String
    @Binding var major: String
    @Binding var password: String
    
    var body: some View {
        TabView {
            View_Home()
                .tabItem(){
                    Image(systemName: "house.fill")
                        .foregroundColor(Color(red: 255 / 255.0, green: 225 / 255.0, blue: 132 / 255.0))
                    Text("Home")
                .navigationBarBackButtonHidden(true)
                }
            Messenger_View()
                .tabItem(){
                    Image(systemName:"message.circle.fill")
                    Text("Message")
                }
           Post_View()
                .tabItem(){
                    Image(systemName:"plus.app")
                    Text("Upload")
                }
            Settings_View()
                .tabItem(){
                    Image(systemName:"gearshape")
                    Text("Settings")
                }
            Profile_View(first: $first, last: $last, number: $number, address: $address, username: $username, age: $age, major: $major, password: $password)
                .tabItem(){
                    Image(systemName:"person.crop.circle")
                    Text("Profile")
                }
            }
        .navigationBarBackButtonHidden(true)
        .tabViewStyle(DefaultTabViewStyle()) // Use the default tab style
        .onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(red: 254/255, green: 166/255, blue: 237/255, alpha: 1.0) // RGB color (255, 225, 132)
            appearance.selectionIndicatorTintColor = .white // Change the tab selection indicator color

            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
            }
        }


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(first: .constant("jane"), last: .constant("doe"), number: .constant("1234567890"), address: .constant("456 Main St"), username: .constant("user 2"), age: .constant("25"), major: .constant("Engineering"), password: .constant("mypassword"))
    }
}
