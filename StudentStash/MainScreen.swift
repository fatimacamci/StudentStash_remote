//
//  MainScreen.swift
//  StudentStash
//
//  Created by Fatima Camci on 7/18/23.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        TabView {
            View_Home()
                .tabItem(){
                    Image(systemName: "house.fill")
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
            Profile_View()
                .tabItem(){
                    Image(systemName:"person.crop.circle")
                    Text("Profile")
                }
            }
        .navigationBarBackButtonHidden(true)
        //.edgesIgnoringSafeArea(.top)
        }
    }


struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
